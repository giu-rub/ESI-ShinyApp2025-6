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
              h2("What does the ESI do?"),
              p("The Earth System Impact metric represents a step forward in environmental impact metrics, 
                as it captures some of the complexity of the Earth System in the following four ways:"),
              p("1. Capture impacts on multiple Earth processes (i.e. climate, land and water)."),
              p("2. Accounts for the key Earth System interactions, thus considering how impacts on one Earth System component affect others."),
              p("3. Distinguishes impacts on land and water by location, since the global effects of local environmental pressures can vary dramatically depending on where they happen (e.g. deforestation of tropical forests being extremely impactful on the climate)."),
              p("4. Measures impact in relation to regional boundaries, considering how close to transgressing the 'safe operating space' a particular region already is."),
              p("Because of the importance that location plays in the metric, the ESI is normally estimated at the asset-level, meaning for each individual facility."),
              p("Using the ESI only requires four inputs of data.")
            )
          ),
          
          div(
            id = "storymap3-block-inter1",
            class = "story-static-section",
            style = "scroll-margin-top: 140px;",
            div(
              class = "esi-section",
              h2("Interpreting the ESI"),
              p("Calculating the ESI score will output four values: one representing the total impact of that asset, and the other three representing the contribution of each impact driver (i.e., carbon emissions, land use, and water use)."),
              p("For example, a facility with a higher Water ESI than Climate ESI means that water use contributes more to the Earth System Impact of that facility than greenhouse gas emissions."),
              p("Breaking down the total ESI score into its individual components allows identification, for each asset, of what is most problematic and needs to be mitigated.")
            )
          ),
          
          div(
            id = "storymap3-block-inter2",
            class = "story-static-section",
            style = "scroll-margin-top: 140px;",
            div(
              class = "esi-section2",
              p("The ESI score allows decision-makers to compare the (Earth System) impact of different investments. This could be done to decide in which kinds of projects to invest in, or to identify 
                the most harmful investments or assets to prioritize mitigation actions."),
              p("ESI values are scaled so that a score of 1 million means that the activities contribute to shifting one of the variables (climate, water, or land) from their pre-industrial conditions 
                to their planetary boundaries. A larger ESI score means a larger shift towards the boundaries. ESI scores are usually much smaller than 1M, this however does not represent negligible impact.")
            )
          )
        ),
        
        # RIGHT COLUMN: one static sticky image
        div(
          class = "sticky-pane",
          div(
            class = "scene-frame",
            div(
              class = "esi-image-section",
              tags$img(
                src = "assets/images/inter1.png",   # <- choose your one static image
                alt = "ESI illustration",
                style = "max-width: 95%; height: auto; max-height: 70vh; object-fit: contain; margin-top: 1rem;"
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