mod_storymap3_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    tags$head(
      tags$style(HTML("
    #storymap3-block-inter1 {
      margin-top: 100px;
    }
  "))
    ),
    
    div(
      class = "storymap-root storymap3",
      id = ns("root"),
      
      div(
        class = "storymap-wrap",
        
        # LEFT COLUMN: static text sections
        div(
          class = "story-column",
          
          div(
            id = "storymap3-block-esi",
            class = "story-static-section",
            style = "scroll-margin-top: 140px;",
            div(
              class = "esi-section-thirdpane",
              h2("How the Earth System Impact  tool (ESI) calculates the score of a project or an asset"),
              p("Assessing the Earth System impact of an asset requires four data inputs:"),
              p("1. Location of an asset/project"),
              p("2. GHG emissions (of that asset/ project)"),
              p("3. Area of land use (of that asset/ project)"),
              p("4. Amount of water consumption (of that asset/ project) "),
              p("Because of the importance that location plays in the score, the ESI is generally estimated at the level of individual assets or facilities. But the ESI can also be used to assess scenarios of impacts for products (see Using the ESI)"),
            )
          ),
          
          div(
            id = "storymap3-block-inter1",
            class = "story-static-section",
            style = "scroll-margin-top: 140px;",
            div(
              class = "esi-section",
              h2("Interpreting the ESI metric (part 1)"),
              p("The ESI score allows decision-makers to compare the impact of different investments. This can be useful for:"),
              p("1. Identifying the most harmful assets in a portfolio,"),
              p("2. Assessing impacts of, and selecting among, several new projects or investments, "),
              p("3. Prioritizing mitigation actions across facilities "),
              p("The ESI score consists of three components, representing the contribution of each impact driver (carbon emissions, land use, and water use) to the 'Total' ESI score."),
              p("Breaking down the ESI score to its individual components allows you to identify, for each asset, which environmental dimension (water, landuse, emissions) contributes the greatest pressures and may need priority attention and mitigation.")
            )
          ),
          
          div(
            id = "storymap3-block-inter2",
            class = "story-static-section",
            style = "scroll-margin-top: 140px;",
            div(
              class = "esi-section2",
              h2("Interpreting the ESI metric (part 2)"),
              p(
                tags$strong("What does the ESI score represent?"),
                tags$br(),
                "Since the ESI captures interactions between different Earth system components, the ESI score represents the impact on all three planetary boundaries simultaneously. A higher ESI score implies larger impact (i.e. more environmental harm) across the three planetary boundaries."
              ),
              
              p(
                tags$strong("What is the unit of the ESI?"),
                tags$br(),
                "The ESI assesses impacts relative to multiple planetary boundaries, each of which is measured by its own variable (e.g. CO2 concentration, ppm, water use per year). Therefore, since the ESI integrates multiple boundaries, it has no single unit."
              )
            )
          )
        ),
        
        # RIGHT COLUMN: video + button
        div(
          class = "sticky-pane",
          
          div(
            class = "scene-frame",
            
            # --- VIDEO ---
            div(
              class = "esi-image-section",
              tags$video(
                src = "assets/images/showcase_tablet_tutorial.mp4",
                controls = NA,
                autoplay = NA,
                loop = NA,
                muted = NA,
                style = "max-width: 95%; height: auto; max-height: 70vh; object-fit: contain; margin-top: 1rem;"
              )
            ),
            
            # --- BUTTON BELOW ---
            div(
              style = "
        margin-top: 24px;
        display: flex;
        justify-content: center;
      ",
              
              tags$a(
                href = "?page=toolbox",
                class = "btn btn-primary btn-lg",
                "Try the ESI"
              )
            )
          )
        )
      )
    )
  )
}

mod_storymap3_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # no server logic needed
  })
}