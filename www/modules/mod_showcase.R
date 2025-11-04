.showcase_body_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      id = "showcase-content",
      style = "padding-bottom: 4rem; padding-top:4rem; background-color: #E68059;",  
      bslib::page_sidebar(
        sidebar = bslib::sidebar(
          width = "30%",
          collapse_sidebar = FALSE,
          open = "always",
          # Inner Tabs
          bslib::navset_card_tab(
            bslib::nav_panel(
              "Input Data",
              p("Clear the example data and fill in the information below to calculate the ESI for an asset. You can add more assets and compare their impacts on the Earth System. The bars represent the ESI broken down by each component. You can click on the checkbox above the plot to show/hide the black line representing CO2e emissions (secondary axis) of assets. The assets in the plot are automatically sorted in descending order of CO2e emissions"),
              selectInput(
                inputId = ns("region"), label = "Region",
                choices = c("Africa", "Asia", "Australia", "Europe", "Oceania", "North America", "South America")
              ),
              selectInput(
                inputId = ns("veg_type"), label = "Vegetation Type",
                choices = c("warm climate grassland", "boreal forest", "cool climate grassland", "temperate forest", "tropical forest")
              ),
              numericInput(inputId = ns("co2_emissions"), label = "CO2e Emissions (tons)", value = NA_real_),
              numericInput(inputId = ns("water_use"), label = "Water Use (thousand m3)", value = NA_real_),
              numericInput(inputId = ns("land_use"),  label = "Land Use (km2)", value = NA_real_),
              textInput(inputId = ns("asset_name"), label = "Asset Name", value = "Example Asset 1"),
              actionButton(inputId = ns("calculate_esi"), label = "Calculate ESI for this asset", class = "btn btn-primary"),
              actionButton(inputId = ns("clear_data"),     label = "Clear Data", class = "btn btn-secondary")
            ),
            bslib::nav_panel(
              "Instructions",
              p("In the input data tab you can insert the data for the assets you want to analyze. The 'clear data' button allows to delete all the input values and start from scratch."),
              h5("Interpreting ESI scores"),
              p("The ESI score represents the total impact of an activity relative to environmental guardrails. The score can be broken down into three components, each of which represent the contribution of each impact driver (i.e. carbon emissions, land use, and water use) towards the total Earth System Impact. ESI scores are scaled to planetary boundaries. In this table values are scaled so that an ESI score of 1M means that the activity would contribute to shifting one of the variables from their pre-industrial conditions to their planetary boundaries. ESI scores are usually much smaller than 1M, this however does not represent negligible impact."),
              h5("Errors and clearing data"),
              p("Note that there are some combinations of region and vegetation type for which there is no value. If you select one of those combinations you will receive an error message, and will need to 'clear data' to start again. The missing combinations are the following:"),
              tags$div(tags$ul(
                tags$li("boreal forest AND one of the following"),
                tags$ul(tags$li("Australia, Oceania, South America, Africa")),
                tags$li("Oceania AND warm OR cool climate grasslands"),
                tags$li("Europe AND cool climate grasslands OR tropical forest")
              )),
            )
          )
        ),
        h5("Asset List"),
        column(
          width = 12,
          DT::dataTableOutput(ns("esi_output")),
          style = "height:30%; overflow-y: scroll"
        ),
        bslib::card(
          bslib::card_header("ESI Breakdown"),
          checkboxInput(inputId = ns("show_carbon_emissions"), label = "Show/Hide Carbon Emissions Line", value = FALSE),
          plotOutput(ns("esi_breakdown_plot"), height = "60%"),
          strong("Disclaimer: This tool is a prototype. It does not replace regulatory requirements or assessments of local environmental impacts.")
        )
      )
    )
  )
}

# ---------- (Optional) If you ever use a bslib navset, this returns a nav_panel wrapper ----------
showcase_panel_ui <- function(id) {
  bslib::nav_panel("Showcase", .showcase_body_ui(id))
}

# ---------- Your app’s module API (keeps names used in app.R) ----------
mod_showcase_ui <- function(id) {
  .showcase_body_ui(id)
}

mod_showcase_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # 1) try global vars first (set in app.R)
    initial_data     <- get0("initial_data",     ifnotfound = NULL)
    Land_ESI_matrix  <- get0("Land_ESI_matrix",  ifnotfound = NULL)
    Water_ESI_matrix <- get0("Water_ESI_matrix", ifnotfound = NULL)
    
    # 2) if missing, try to read from disk (adjust filenames to match your actual files)
    if (is.null(initial_data)) {
      initial_data <- tryCatch(
        readr::read_csv("data/esi_tool_sample(10^6).csv", show_col_types = FALSE),
        error = function(e) data.frame()
      )
    }
    
    if (is.null(Land_ESI_matrix)) {
      land_df <- tryCatch(
        readr::read_csv("data/Land_ESI_coefficients_not_rounded.csv", show_col_types = FALSE),
        error = function(e) NULL
      )
      if (!is.null(land_df)) {
        rn <- land_df[[1]]
        Land_ESI_matrix <- as.matrix(land_df[, -1, drop = FALSE])
        rownames(Land_ESI_matrix) <- rn
        rownames(Land_ESI_matrix) <- trimws(rownames(Land_ESI_matrix))
        colnames(Land_ESI_matrix) <- trimws(colnames(Land_ESI_matrix))
      }
    }
    
    if (is.null(Water_ESI_matrix)) {
      water_df <- tryCatch(
        readr::read_csv("data/Water_ESI_coefficients.csv", show_col_types = FALSE),
        error = function(e) NULL
      )
      if (!is.null(water_df)) {
        rn <- water_df[[1]]
        Water_ESI_matrix <- as.matrix(water_df[, -1, drop = FALSE])
        rownames(Water_ESI_matrix) <- rn
        rownames(Water_ESI_matrix) <- trimws(rownames(Water_ESI_matrix))
        colnames(Water_ESI_matrix) <- trimws(colnames(Water_ESI_matrix))
      }
    }
    
    # Basic guardrails
    if (is.null(Land_ESI_matrix) || is.null(Water_ESI_matrix)) {
      showNotification(
        "Land_ESI_matrix / Water_ESI_matrix not found or could not be read. Define them in app.R or ensure CSVs are in /data.",
        type = "error", duration = 10
      )
    }
    
    # ---- Reactive store ----
    assets <- reactiveValues(data = data.frame())
    observe({
      if (is.null(assets$data) || nrow(assets$data) == 0) {
        assets$data <- initial_data
      }
    })
    
    # ---- Clear data ----
    observeEvent(input$clear_data, {
      assets$data <- data.frame()
      showNotification(
        "Data has been cleared. Disregard the error message above and insert your asset data to view the results",
        type = "default", duration = 10
      )
    })
    
    # ---- Calculate ESI for one asset ----
    observeEvent(input$calculate_esi, {
      # Validate required inputs
      if (isTRUE(input$asset_name == "") ||
          isTRUE(is.na(input$co2_emissions)) ||
          isTRUE(is.na(input$land_use)) ||
          isTRUE(is.na(input$water_use))) {
        showNotification("Please fill in all required fields.", type = "error")
        return(invisible(NULL))
      }
      
      # Coeffs for this combo (handle missing combos)
      land_coef  <- tryCatch(Land_ESI_matrix[input$region, input$veg_type],  error = function(e) NA_real_)
      water_coef <- tryCatch(Water_ESI_matrix[input$region, input$veg_type], error = function(e) NA_real_)
      if (is.na(land_coef) || is.na(water_coef)) {
        showNotification(
          "No coefficients available for this Region / Vegetation Type combination. Click 'Clear Data' and try another combination.",
          type = "error", duration = 8
        )
        return(invisible(NULL))
      }
      
      # Build new row
      new_asset <- data.frame(
        AssetName    = input$asset_name,
        Region       = input$region,
        VegType      = input$veg_type,
        CO2Emissions = as.numeric(input$co2_emissions),
        LandUse      = as.numeric(input$land_use),
        WaterUse     = as.numeric(input$water_use),
        stringsAsFactors = FALSE
      )
      
      # ESI calcs
      new_asset$Carbon_ESI <- new_asset$CO2Emissions * 2.80e-12 * 1e6
      new_asset$Land_ESI   <- new_asset$LandUse      * 1e6 * land_coef
      new_asset$Water_ESI  <- new_asset$WaterUse     * 1e6 * water_coef
      new_asset$Total_ESI  <- new_asset$Carbon_ESI + new_asset$Land_ESI + new_asset$Water_ESI
      
      # Append + reset inputs
      assets$data <- rbind(assets$data, new_asset)
      updateNumericInput(session, "co2_emissions", value = NA_real_)
      updateNumericInput(session, "land_use",      value = NA_real_)
      updateNumericInput(session, "water_use",     value = NA_real_)
      updateTextInput(session,   "asset_name",     value = "")
    })
    
    # ---- Table ----
    esi_formatted <- reactive({
      df <- assets$data
      if (is.null(df) || !nrow(df)) return(df)
      
      dplyr::as_tibble(df) |>
        dplyr::mutate(dplyr::across(
          c("Carbon_ESI", "Land_ESI", "Water_ESI", "Total_ESI"),
          ~ ifelse(. < 0.01,
                   formatC(., format = "e", digits = 2),
                   formatC(., format = "f", digits = 2, big.mark = ","))
        )) |>
        dplyr::mutate(dplyr::across(
          c("CO2Emissions", "LandUse", "WaterUse"),
          ~ formatC(., format = "f", digits = 0, big.mark = ",")
        ))
    })
    
    output$esi_output <- DT::renderDT({
      DT::datatable(
        esi_formatted(),
        rownames = FALSE,
        options = list(
          dom = 't',
          buttons = c('copy', 'csv', 'excel', 'pdf', 'print'),
          pageLength = 10
        )
      )
    })
    
    # ---- Plot ----
    output$esi_breakdown_plot <- renderPlot({
      df <- assets$data
      if (is.null(df) || !nrow(df)) return(invisible(NULL))
      
      full_long <- df |>
        tidyr::pivot_longer(
          cols = c("Carbon_ESI", "Land_ESI", "Water_ESI"),
          names_to = "impact_type",
          values_to = "ESI_value"
        ) |>
        dplyr::arrange(dplyr::desc(Total_ESI))
      
      max_esi <- max(full_long$ESI_value, na.rm = TRUE)
      max_co2 <- max(df$CO2Emissions,    na.rm = TRUE)
      scale_plot <- if (isTRUE(max_co2 > 0)) max_esi / max_co2 else 1
      
      gg <- ggplot2::ggplot(full_long) +
        ggplot2::geom_bar(
          ggplot2::aes(x = reorder(AssetName, -CO2Emissions), y = ESI_value, fill = impact_type),
          position = "stack", stat = "identity"
        ) +
        ggplot2::scale_fill_manual(values = c(Carbon_ESI = "#D62246", Land_ESI = "#238352", Water_ESI = "#5A91ED"))
      
      if (isTRUE(input$show_carbon_emissions) && isTRUE(max_co2 > 0)) {
        gg <- gg +
          ggplot2::geom_line(
            ggplot2::aes(x = reorder(AssetName, -CO2Emissions), y = CO2Emissions * scale_plot, group = 1),
            linewidth = 0.8, color = "black"
          ) +
          ggplot2::scale_y_continuous(
            sec.axis = ggplot2::sec_axis(~ . / scale_plot, name = "CO2 Emissions", labels = scales::comma)
          )
      }
      
      gg +
        ggplot2::labs(x = "Assets", y = "Earth System Impact") +
        ggplot2::theme_minimal() +
        ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1))
    })
  })
}
