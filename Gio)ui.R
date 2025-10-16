section_panel <- function(id, ...) {
  div(
    id = id,
    class = "section",
    div(class = "container-lg px-3 px-md-5", ...)
  )
}
# defintion of UI 
ui <- page_fluid(
  title = HTML("ESI prototype tool"),
  theme = bs_theme(bootswatch = "united", font = font_google("Lato"), primary = "#E68059"),
  
# definiton of style
  tags$head(
    tags$script(
      HTML(
        "<!-- Google tag (gtag.js) -->
         <script async src='https://www.googletagmanager.com/gtag/js?id=G-20QL733ETT'></script>
         <script>
         window.dataLayer = window.dataLayer || [];
         function gtag(){dataLayer.push(arguments);}
         gtag('js', new Date());
         gtag('config', 'G-20QL733ETT');
         </script>"
      )
    ),
    tags$style(
      HTML(
        "body {font-family: 'Lato', sans-serif;}
         .section {padding: 4rem 0;}
         .section + .section {border-top: 1px solid #e9ecef;}
         .section h3 {font-weight: 700;}
         .sidebar {position: sticky; top: 1rem;}
         @media (max-width: 991.98px) {
           .sidebar {position: static;}
         }
         .data-scroll {max-height: 420px; overflow-y: auto;}
         .download-card {max-width: 420px; margin: 0 auto;}
         .disclaimer {font-size: 0.9rem; color: #5f5f5f;}
         img.responsive-graphic {width: 100%; max-width: 900px;}
         img.download-preview {width: 100%; max-width: 520px;}
         .map-notes li + li {margin-top: 0.5rem;}
         .map-downloads .btn {min-width: 140px;}
         body { padding-top: 72px;}
          .navbar-brand { font-weight: 700;}
        .navbar-logo { height: 36px;}
        "
      )
    )
  ),
  
# definition of navbar
  tags$nav(
    class = "navbar navbar-expand-lg navbar-dark bg-primary fixed-top",
    div(
      class = "container-lg px-3 px-md-5",
      # Brand / title on the left
      tags$a(class = "navbar-brand", href = "#intro-section", "ESI prototype tool"),
      
      # Mobile toggler
      tags$button(
        class = "navbar-toggler", type = "button",
        `data-bs-toggle` = "collapse", `data-bs-target` = "#topnav",
        `aria-controls` = "topnav", `aria-expanded` = "false", `aria-label` = "Toggle navigation",
        tags$span(class = "navbar-toggler-icon")
      ),
      
      # Collapsible content
      div(
        id = "topnav", class = "collapse navbar-collapse",
        
        # Left-aligned nav links
        tags$ul(
          class = "navbar-nav me-auto mb-2 mb-lg-0",
          tags$li(class = "nav-item", tags$a(class = "nav-link", href = "#about-section", "About")),
          tags$li(class = "nav-item", tags$a(class = "nav-link", href = "#showcase-section", "Showcase")),
          tags$li(class = "nav-item", tags$a(class = "nav-link", href = "#downloads-section", "Downloads")),
          tags$li(class = "nav-item", tags$a(class = "nav-link", href = "#map-section", "Map"))
        ),
        
        # right-aligned logo
        div(
          class = "d-flex align-items-center ms-auto",
          tags$a(
            href = "#intro-section", class = "navbar-brand m-0 p-0",
            img(src = "esi_logo.png", class = "navbar-logo d-inline-block align-text-top", alt = "ESI logo")
          )
        )
      )
    )
  ),
  
# first section: cover page
  section_panel(
    "intro-section",
    h1("The Earth System Impact tool"),
    p("Keeping the impact of your assets within Planetary Boundaries"),
  ),

# second section: 
  section_panel(
    "about-section",
    h3("The Earth System Impact tool – some key facts and disclaimers"),
    h5("This web page showcases the prototype Earth System Impact (ESI) score."),
    p(
      "Stability of the Earth’s climate system depends on both reducing GHG emissions while simultaneously bolstering the",
      " resilience of key regions (biomes) of the planet. Mitigating severe systemic risks related to climate change and",
      " concurrent nature degradation therefore hinges on our ability to rapidly reduce the harm incurred through economic activities."
    ),
    p(
      "By assessing the planetary scale impact of assets and providing improved information for decision-making, ESI is",
      " a tool that can improve…", br("…how companies assess the impact of their operations, or"),
      "…how investors assess the impact of their portfolios."
    ),
    p(
      "The ESI tool is:",
      tags$ul(
        tags$li("Systemic: it accounts for Earth system components other than climate (CO2), such as water and landuse, and most importantly, the interactions between these three"),
        tags$li("Context sensitive: it distinguishes impacts by region and vegetation type"),
        tags$li("Science based: it accounts for the current state of each Earth system component relative to scientifically estimated guardrails – i.e. it accounts for total availability")
      )
    ),
    p("For more details on how the prototype was developed see", a("Lade et al. 2021", href = "https://iopscience.iop.org/article/10.1088/1748-9326/ac2db1")),
    p(
      "For a short introduction on ESI see",
      a("this brief", href = "https://www.gedb.se/upl/files/194920/esi-a-tool-to-better-capture-corporate-and-investment-impacts-on-the-earth-system-v1-1.pdf", target = "_blank"),
      ", and for more information on how it can be applied by corporate actors, banks or other financial institutions see",
      a("Crona et al. 2023,", href = "https://doi.org/10.1016/j.jclepro.2023.139523"),
      "which also includes a case study applying the ESI on a sample of mining companies."
    ),
    div(class = "my-4 text-center", img(src = "ESi_interactions_5.png", class = "responsive-graphic")),
    div(
      class = "disclaimer",
      strong("Disclaimer"),
      br(),
      strong(
        "This tool is currently a prototype. We advise caution when interpreting its results and it should not be used to replace",
        " regulatory requirements. Given its focus on planetary-scale impacts it also does not replace assessments of local environmental impacts, such as pollution or biodiversity impacts."
      )
    )
  ),
  
  section_panel(
    "showcase-section",
    h3("ESI Asset Showcase"),
    div(
      class = "row g-4 align-items-start",
      div(
        class = "col-lg-5 col-xl-4 sidebar",
        navset_card_tab(
          nav_panel(
            "Input Data",
            p(
              "Clear the example data and fill in the information below to calculate the ESI for an asset. You can add more assets",
              " and compare their impacts on the Earth System. The bars represent the ESI broken down by each component. You can click",
              " on the checkbox above the plot to show/hide the black line representing CO2e emissions (secondary axis) of assets. The",
              " assets in the plot are automatically sorted in descending order of CO2e emissions"
            ),
            selectInput(
              inputId = "region",
              label = "Region",
              choices = c(
                "Africa", "Asia", "Australia", "Europe", "Oceania", "North America", "South America"
              )
            ),
            selectInput(
              inputId = "veg_type",
              label = "Vegetation Type",
              choices = c(
                "warm climate grassland", "boreal forest", "cool climate grassland", "temperate forest", "tropical forest"
              )
            ),
            numericInput("co2_emissions", "CO2e Emissions (tons)", value = ""),
            numericInput("water_use", "Water Use (thousand m3)", value = ""),
            numericInput("land_use", "Land Use (km2)", value = ""),
            textInput("asset_name", "Asset Name", value = "Example Asset 1"),
            div(
              class = "d-grid gap-2 mt-3",
              actionButton("calculate_esi", "Calculate ESI for this asset", class = "btn btn-primary"),
              actionButton("clear_data", "Clear Data", class = "btn btn-secondary")
            )
          ),
          nav_panel(
            "Instructions",
            p("In the input data tab you can insert the data for the assets you want to analyze. The 'clear data' button allows to delete all the input values and start from scratch."),
            h5("Interpreting ESI scores"),
            p(
              "The ESI score represents the total impact of an activity relative to environmental guardrails. The score can be broken down",
              " into three components, each of which represent the contribution of each impact driver (i.e. carbon emissions, land use, and",
              " water use) towards the total Earth System Impact. ESI scores are scaled to planetary boundaries. In this table values are",
              " scaled so that an ESI score of 1M means that the activity would contribute to shifting one of the variables from their pre-industrial",
              " conditions to their planetary boundaries. ESI scores are usually much smaller than 1M, this however does not represent negligible impact."
            ),
            h5("Errors and clearing data"),
            p(
              "Note that there are some combinations of region and vegetation type for which there is no value. If you select one of those",
              " combinations you will receive an error message, and will need to 'clear data' to start again. The missing combinations are the following:"
            ),
            tags$ul(
              tags$li("boreal forest AND one of the following"),
              tags$ul(tags$li("Australia, Oceania, South America, Africa")),
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
        div(class = "data-scroll mb-4", DT::dataTableOutput("esi_output")),
        card(
          card_header("ESI Breakdown"),
          div(class = "form-check mb-3", checkboxInput("show_carbon_emissions", "Show/Hide Carbon Emissions Line", value = FALSE)),
          plotOutput("esi_breakdown_plot", height = "60%"),
          div(
            class = "disclaimer mt-3",
            strong(
              "Disclaimer: This tool is currently a prototype. We advise caution when interpreting its results and it should not be used",
              " to replace regulatory requirements. Given its focus on planetary-scale impacts it also does not replace assessments of local",
              " environmental impacts, such as pollution or biodiversity impacts."
            )
          )
        )
      )
    )
  ),
  
  section_panel(
    "downloads-section",
    h3("Downloads"),
    h5("On this page you can download the prototype tool in Excel format, and the accompanying user manual"),
    p("The ESI Excel tool allows companies and investors to test the ESI metric using their own data, and gain further insights into the planetary-scale environmental impact of their activities."),
    p(
      strong("Please note that the ESI metric is currently a prototype."),
      " We advise caution when interpreting its results, and it should not be used to replace regulatory requirements. Given its focus",
      " on planetary-scale impacts, it also does not replace assessments of local environmental impacts, such as pollution or biodiversity impacts."
    ),
    p(
      "You can download the zip folder containing both the Excel tool and",
      a("the user manual", href = "ESI_tool_manual.pdf", target = "_blank"),
      "by clicking on the button below."
    ),
    div(
      class = "download-card text-center",
      tags$a(
        class = "btn btn-primary w-100",
        href = "ESI_prototype_tool.v1.1.zip",
        download = "ESI_prototype_tool.v1.1.zip",
        role = "button",
        "Download Excel Tool (zip folder)"
      )
    ),
    p(
      class = "disclaimer mt-4",
      strong("DISCLAIMER:"),
      " This tool is still in first iteration. It is possible that other errors might be encountered, or that the steps suggested above do not help resolve the issue. In these cases, we would love to hear from you so that we can further improve the tool. Please reach out to giorgio.parlato(at)su.se and explain the issue you are encountering."
    ),
    div(class = "my-4 text-center", img(src = "ESI_manual_pic.png", class = "download-preview"))
  ),
  
  section_panel(
    "map-section",
    h3("ESI Dynamic Heatmap"),
    p("Here you can input data of a hypothetical asset to view how that assets' ESI would vary depending on its location"),
    p("The panel on the bottom left of the map allows you to select the layer displayed in the map. The ESI layer represents the total impact of an activity relative to environmental guardrails, while the other three layers represent the contribution of each impact driver (i.e. carbon emissions, land use, and water use) towards the total ESI."),
    div(
      class = "row g-4 align-items-start",
      div(
        class = "col-lg-5 col-xl-4 sidebar",
        h5("Input Data for Heatmap"),
        numericInput("co2_emissions_map", "CO2e Emissions (tons)", value = 0),
        numericInput("land_use_map", "Land Use (km2)", value = 0),
        numericInput("water_use_map", "Water Use (thousand m3)", value = 0)
      ),
      div(
        class = "col-lg-7 col-xl-8",
        h5("Total ESI by location (given inputs)"),
        leafletOutput("world_map_plot"),
        p(class = "mt-3", "With the buttons below you can download the 'Total ESI' map you produced in one of the following formats."),
        div(
          class = "map-downloads d-flex flex-wrap gap-2",
          downloadButton("download_csv", "Download ASC", class = "btn btn-primary"),
          downloadButton("download_tiff", "Download TIFF", class = "btn btn-primary"),
          downloadButton("download_netcdf", "Download NetCDF", class = "btn btn-primary")
        ),
        p(class = "mt-3", "All download formats can be read by GIS applications."),
        tags$ul(
          class = "map-notes",
          tags$li("ASC files are text files that can also be imported in Excel."),
          tags$li("TIFF files are image file formats for raster images."),
          tags$li("The NetCDF format allows storing multidimensional data. In this case the file includes all four layers displayed in the map (Total ESI, Land ESI, Water ESI, Carbon ESI)")
        ),
        h5(class = "mt-4", "Notes"),
        tags$ul(
          tags$li("ESI scores are scaled to planetary boundaries. In this table values are scaled so that an ESI score of 1M means that the activity would contribute to shifting one of the variables from their pre-industrial conditions to their planetary boundaries. ESI scores are usually much smaller than 1M, this however, does not represent negligible impact."),
          tags$li("ESI scores cannot currently be calculated for areas classified as 'bare land', these areas are thus not colored at all in the heatmap")
        )
      )
    )
  )
)
