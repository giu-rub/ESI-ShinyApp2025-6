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
          style = "text-align: justify;",
          
          div(
            id = "storymap3-block-esi",
            class = "story-static-section",
            style = "scroll-margin-top: 140px;",
            div(
              class = "esi-section-thirdpane",
              h2("How the Earth System Impact tool (ESI) calculates the score of a project or an asset"),
              p("Assessing the Earth System impact of an asset requires four data inputs:"),
              p("1. Location of an asset/project"),
              p("2. GHG emissions (of that asset/project)"),
              p("3. Area of land use (of that asset/project)"),
              p("4. Amount of water consumption (of that asset/project)"),
              p("Because of the importance that location plays in the score, the ESI is generally estimated at the level of individual assets or facilities. But the ESI can also be used to assess scenarios of impacts for products (see Using the ESI).")
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
              p("1. Identifying the most harmful assets in a portfolio"),
              p("2. Assessing impacts of, and selecting among, several new projects or investments"),
              p("3. Prioritizing mitigation actions across facilities"),
              p("The ESI score consists of three components, representing the contribution of each impact driver (carbon emissions, land use, and water use) to the Total ESI score."),
              p("Breaking down the ESI score into its individual components allows you to identify, for each asset, which environmental dimension (water, land use, emissions) contributes the greatest pressures and may need priority attention and mitigation.")
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
          ),
          
          div(
            id = "storymap3-block-value",
            class = "story-static-section",
            style = "scroll-margin-top: 140px;",
            div(
              class = "esi-section",
              h2("The added value of the ESI"),
              p("An analysis of the ESI impact of some large mining companies shows that carbon-focused impact assessments may provide misleading results and may miss important nature-related impacts and risks."),
              p("Indeed, the graph to the right (bottom) shows clearly that the most impactful mines (from a total ESI perspective) would only be perceived as having intermediate or relatively low carbon intensity."),
              p("In other words, assets may have a high impact on the Earth System, even though their carbon emissions are relatively low or average in comparison with other assets. This is because their impact is driven primarily by land and/or water use and not just carbon.")
            )
          ),
          
          div(
            id = "storymap3-block-using",
            class = "story-static-section",
            style = "scroll-margin-top: 140px;",
            div(
              class = "esi-section",
              h2("Using the ESI score for assessing impact in/of your organization"),
              p("The ESI score can be used in different ways, depending on the purpose of use and the type of user. Below we outline 5 types of users and uses of the score."),
              p("1. Compare the Earth System impact of different projects, assets, companies, or portfolios"),
              p("2. Identify the main drivers contributing to the impact of a given asset/company/portfolio"),
              p("3. Estimate the impacts of planned production sites"),
              p("4. Estimate the impacts of alternative planned (or existing) suppliers for sourcing materials (test the interactive ESI map!)"),
              p("5. Measure before/after environmental performance of a project/asset/company a (for example as way to conduct post-issuance verification of green bonds)"),
              p("We are currently developing a series of case studies that illustrate each of these use cases, and they will gradually be published here. If you have a use case or would like to pilot the use of ESI in your organization – please reach out")
            )
          ),
          
          div(
            class = "esi-image-section",
            div(
              style = "
                margin-top: 2rem;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 200px;
              ",
              tags$a(
                href = "?page=toolbox",
                class = "btn btn-primary btn-lg",
                "Try the ESI Map"
              )
            )
          )
        ),
        
        # RIGHT COLUMN: matching media blocks
        div(
          class = "sticky-pane",
          
          div(
            class = "scene-frame",
            
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
  })
}