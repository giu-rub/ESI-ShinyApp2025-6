mod_map_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h3("ESI Dynamic Heatmap"),
    p("Here you can input data of a hypothetical asset..."),
    p("The panel on the bottom left of the map allows you to select the layer..."),
    div(
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
        leaflet::leafletOutput(ns("world_map_plot")),
        p(class="mt-3", "With the buttons below you can download the 'Total ESI' map..."),
        div(class="map-downloads d-flex flex-wrap gap-2",
            downloadButton(ns("download_csv"), "Download ASC", class="btn btn-primary"),
            downloadButton(ns("download_tiff"), "Download TIFF", class="btn btn-primary"),
            downloadButton(ns("download_netcdf"), "Download NetCDF", class="btn btn-primary")),
        p(class="mt-3", "All download formats can be read by GIS applications."),
        tags$ul(class="map-notes",
                tags$li("ASC files are text files..."),
                tags$li("TIFF files are image file formats..."),
                tags$li("NetCDF includes all four layers...")),
        h5(class="mt-4", "Notes"),
        tags$ul(
          tags$li("ESI scores are scaled to planetary boundaries..."),
          tags$li("ESI scores cannot currently be calculated for 'bare land'...")
        )
      )
    )
  )
}

mod_map_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # output$world_map_plot <- leaflet::renderLeaflet({...})
    # download handlers: output$download_csv <- downloadHandler(...)
  })
}
