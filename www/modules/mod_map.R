mod_map_ui <- function(id) {
  ns <- NS(id)
  tagList(
      div(
        style = "padding-top: 2rem; padding-bottom: 4rem; background-color: #E68059;", 
        h3("ESI Dynamic Heatmap"),
      class = "row g-4 align-items-start",
      div(
        class = "col-lg-5 col-xl-4 sidebar",
        h5("Input Data for Heatmap"),
        numericInput(ns("co2_emissions_map"), "CO2e Emissions (tons)", value = 0),
        numericInput(ns("land_use_map"), "Land Use (km2)", value = 0),
        numericInput(ns("water_use_map"), "Water Use (thousand m3)", value = 0)
      ),
      div(
        class = "col-lg-7 col-xl-8",
        h5("Total ESI by location (given inputs)"),
        leaflet::leafletOutput(ns("world_map_plot"), height = 550),
        p(class="mt-3", "With the buttons below you can download the 'Total ESI' map..."),
        div(class="map-downloads d-flex flex-wrap gap-2",
            downloadButton(ns("download_csv"),   "Download ASC",   class="btn btn-map"),
            downloadButton(ns("download_tiff"),  "Download TIFF",  class="btn btn-map"),
            downloadButton(ns("download_netcdf"),"Download NetCDF",class="btn btn-map")),
        h5(class="mt-4", "Notes"),
        tags$ul(
          tags$li("ESI scores are scaled to planetary boundaries..."),
          tags$li("ESI scores cannot currently be calculated for 'bare land'...")
        )
      )
    )
  )
}

mod_map_server <- function(id, r) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    
    # palettes (vectors)
    heatmap_colors2      <- c("#BFE499", "#F9DF8B", "#f7b267","#f79d65","#f4845f","#f27059","#f25c54","#F05C42","#ED3C1D")
    custom_green_colors2 <- c("#c7e9c0", "#a1d99b", "#74c476", "#41ab5d", "#238b45", "#006d2c", "#00441b")
    custom_blue_colors2  <- c("#86C5DA", "#5DAFD3", "#349ACD", "#1E80B0", "#17679A", "#115085", "#0B3A6F", "#062659", "#021443")
    reds                 <- c("#FFFFFF", "#F05C42")
    
    # raster math from inputs
    heatmap_data_reactive <- reactive({
      req(input$co2_emissions_map, input$land_use_map, input$water_use_map)
      L_ESI <- (10^6) * (input$land_use_map     * r$l_esi)
      W_ESI <- (10^6) * (input$water_use_map    * r$w_esi)
      C_ESI <- (10^6) * (input$co2_emissions_map* r$c_esi)
      ESI   <- L_ESI + W_ESI + C_ESI
      names(ESI) <- "ESI"; names(L_ESI) <- "L_ESI"; names(W_ESI) <- "W_ESI"; names(C_ESI) <- "C_ESI"
      c(ESI, L_ESI, W_ESI, C_ESI)
    })
    
    # map
    output$world_map_plot <- renderLeaflet({
      hmr <- heatmap_data_reactive()
      pal_esi   <- colorNumeric(heatmap_colors2,      values(hmr$ESI),   na.color = "transparent")
      pal_land  <- colorNumeric(custom_green_colors2, values(hmr$L_ESI), na.color = "transparent")
      pal_water <- colorNumeric(custom_blue_colors2,  values(hmr$W_ESI), na.color = "transparent")
      
      if (input$co2_emissions_map == 0 && input$land_use_map == 0 && input$water_use_map == 0) {
        leaflet() |>
          addTiles() |>
          setMaxBounds(-180, 83.5, 190.2, -85) |>
          setView(0, 0, zoom = 2)
      } else {
        leaflet() |>
          addTiles() |>
          addRasterImage(hmr$ESI,   colors = pal_esi,   opacity = 0.8, group = "ESI") |>
          addRasterImage(hmr$L_ESI, colors = pal_land,  opacity = 0.8, group = "Land ESI") |>
          addRasterImage(hmr$W_ESI, colors = pal_water, opacity = 0.8, group = "Water ESI") |>
          addRasterImage(hmr$C_ESI, colors = colorNumeric(reds, values(hmr$C_ESI), na.color = "transparent"),
                         opacity = 0.8, group = "Carbon ESI") |>
          addLegend(pal = pal_esi, values = values(hmr$ESI), title = "ESI",
                    position = "bottomright", group = "ESI") |>
          addLayersControl(
            baseGroups = c("ESI", "Land ESI", "Water ESI", "Carbon ESI"),
            position = "bottomleft",
            options = layersControlOptions(collapsed = FALSE)
          ) |>
          hideGroup("Land ESI") |>
          hideGroup("Water ESI") |>
          hideGroup("Carbon ESI") |>
          setView(0, 0, zoom = 2)
      }
    })
    
    # legend switching
    observeEvent(input$world_map_plot_groups, {
      hmr <- heatmap_data_reactive()
      pal_esi   <- colorNumeric(heatmap_colors2,      values(hmr$ESI),   na.color = "transparent")
      pal_land  <- colorNumeric(custom_green_colors2, values(hmr$L_ESI),  na.color = "transparent")
      pal_water <- colorNumeric(custom_blue_colors2,  values(hmr$W_ESI),  na.color = "transparent")
      m <- leafletProxy("world_map_plot") |> clearControls()
      
      if (input$world_map_plot_groups == "ESI") {
        m |> addLegend(pal = pal_esi, values = values(hmr$ESI), title = "ESI", position = "bottomright")
      }
      if (input$world_map_plot_groups == "Water ESI") {
        m |> addLegend(pal = pal_water, values = values(hmr$W_ESI), title = "Water ESI", position = "bottomright")
      }
      if (input$world_map_plot_groups == "Land ESI") {
        m |> addLegend(pal = pal_land, values = values(hmr$L_ESI), title = "Land ESI", position = "bottomright")
      }
      if (input$world_map_plot_groups == "Carbon ESI") {
        m |> addLegend(colors = c("#FFFFFF", "#F05C42"),
                       labels = c(0, round(max(values(hmr$C_ESI), na.rm = TRUE), 4)),
                       title = "CO2 ESI", position = "bottomright")
      }
    })
    
    # ASC grid of the ESI layer (uses the ASCII driver explicitly)
    output$download_csv <- downloadHandler(
      filename = function() paste0("heatmap_data_", Sys.Date(), ".asc"),
      content = function(file) {
        hmr <- heatmap_data_reactive()
        esi <- hmr[["ESI"]]
        tryCatch({
          terra::writeRaster(esi, file, filetype = "AAIGrid", overwrite = TRUE)
        }, error = function(e) {
          message("ASC export failed: ", conditionMessage(e))
          stop(e)
        })
      }
    )
    
    
    # GeoTIFF of the ESI layer (force GTiff so gdal chooses the right driver)
    output$download_tiff <- downloadHandler(
      filename = function() paste0("heatmap_data_", Sys.Date(), ".tif"),
      content = function(file) {
        hmr <- heatmap_data_reactive()
        esi <- hmr[["ESI"]]
        tryCatch({
          terra::writeRaster(esi, file, filetype = "GTiff", overwrite = TRUE)
        }, error = function(e) {
          message("GeoTIFF export failed: ", conditionMessage(e))
          stop(e)
        })
      }
    )
    
    # NetCDF with all four layers (terra::writeCDF handles NetCDF)
    output$download_netcdf <- downloadHandler(
      filename = function() paste0("heatmap_data_", Sys.Date(), ".nc"),
      content = function(file) {
        hmr <- heatmap_data_reactive()
        # ensure order & names are correct
        out <- hmr[[c("ESI", "W_ESI", "L_ESI", "C_ESI")]]
        tryCatch({
          terra::writeCDF(out, file, split = TRUE, overwrite = TRUE)
        }, error = function(e) {
          message("NetCDF export failed: ", conditionMessage(e))
          stop(e)
        })
      }
    )
  }) 
}
