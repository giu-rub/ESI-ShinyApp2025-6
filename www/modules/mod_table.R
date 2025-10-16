mod_table_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h3("ESI Asset Showcase"),
    div(
      class = "row g-4 align-items-start",
      div(
        class = "col-lg-5 col-xl-4 sidebar",
        bslib::navset_card_tab(
          bslib::nav_panel(
            "Input Data",
            p("Clear the example data and fill in the information below to calculate the ESI for an asset..."),
            selectInput(ns("region"), "Region",
                        choices = c("Africa","Asia","Australia","Europe","Oceania","North America","South America")),
            selectInput(ns("veg_type"), "Vegetation Type",
                        choices = c("warm climate grassland","boreal forest","cool climate grassland","temperate forest","tropical forest")),
            numericInput(ns("co2_emissions"), "CO2e Emissions (tons)", value = NA),
            numericInput(ns("water_use"), "Water Use (thousand m3)", value = NA),
            numericInput(ns("land_use"), "Land Use (km2)", value = NA),
            textInput(ns("asset_name"), "Asset Name", value = "Example Asset 1"),
            div(class = "d-grid gap-2 mt-3",
                actionButton(ns("calculate_esi"), "Calculate ESI for this asset", class = "btn btn-primary"),
                actionButton(ns("clear_data"), "Clear Data", class = "btn btn-secondary"))
          ),
          bslib::nav_panel(
            "Instructions",
            p("In the input data tab you can insert the data for the assets you want to analyze..."),
            h5("Interpreting ESI scores"),
            p("The ESI score represents the total impact of an activity relative to environmental guardrails..."),
            h5("Errors and clearing data"),
            tags$ul(
              tags$li("boreal forest AND one of: Australia, Oceania, South America, Africa"),
              tags$li("Oceania AND warm OR cool climate grasslands"),
              tags$li("Europe AND cool climate grasslands OR tropical forest")
            ),
            p("If you encounter any other issues feel free to reach out to giorgio.parlato(at)su.se")
          )
        )
      ),
      div(
        class = "col-lg-7 col-xl-8",
        h5("Asset List"),
        div(class = "data-scroll mb-4", DT::DTOutput(ns("esi_output"))),
        bslib::card(
          bslib::card_header("ESI Breakdown"),
          div(class="form-check mb-3",
              checkboxInput(ns("show_carbon_emissions"), "Show/Hide Carbon Emissions Line", value = FALSE)),
          plotOutput(ns("esi_breakdown_plot"), height = "60%"),
          div(class="disclaimer mt-3",
              strong("Disclaimer: This tool is currently a prototype..."))
        )
      )
    )
  )
}

mod_table_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # your existing server logic here
    # output$esi_output <- DT::renderDT(...)
    # output$esi_breakdown_plot <- renderPlot({...})
  })
}
