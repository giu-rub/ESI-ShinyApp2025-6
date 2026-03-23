mod_storymap4_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    tags$head(
      tags$style(HTML("
    .story-static-section {
      margin-top: 100px;
    }
  "))
    ),
  
    div(
      class = "storymap-root storymap4",
      id = ns("root"),
      
      div(
        class = "storymap-wrap",
        
        # LEFT COLUMN: static text sections
        div(
          class = "story-column",
          
          div(
            id = "storymap4-block-value",
            class = "story-static-section",
            style = "scroll-margin-top: 140px;",
            div(
              class = "esi-section-fourthpane",
              h2("What is the added value of the ESI?"),
              p("We first tested the ESI on some of the largest mining companies in the world. One clear result was that using GHG emissions to identify the most harmful assets can lead to misleading results. Indeed, we see that the mines with the largest GHG emissions are not necessarily the most harmful ones from an Earth System perspective."),
              p("Indeed, in this figure we see that some of the most impactful mines in our sample look like average emitters, and their impact is driven primarily by land and/or water use.")
            )
          ),
          
          div(
            id = "storymap4-block-engage",
            class = "story-static-section",
            style = "scroll-margin-top: 140px;",
            div(
              class = "esi-section",
              h2("Engaging with the ESI score"),
              p("The ESI score can be used in different ways, depending on the purpose of use and the type of stakeholder."),
              p("1. Comparing the total impact of different planned projects, assets, companies, or portfolios while identifying the main drivers contributing to the impact of a given asset/company/portfolio."),
              p("2. Estimate the impacts of planned production sites or suppliers for sourcing materials (see map below)."),
              p("3. Augmenting LCA analysis with an Earth System perspective.")
            )
          ),
          
          div(
            id = "storymap4-block-limit",
            class = "story-static-section",
            style = "scroll-margin-top: 140px;",
            div(
              class = "esi-section2",
              h2("Limitations of the ESI"),
              p("While the ESI score could be seen as an improvement to current metrics to assess environmental impact, it is important to emphasize its limitations, and the need to integrate it with other measures."),
              p("1. The ESI is regionally aggregated and focuses on impacts at a planetary scale. It does not replace local environmental impact assessments, since it misses important considerations such as water/air pollution or biodiversity impacts."),
              p("2. The score captures three Earth system components, and four of their interactions. Many other dimensions could be included and work is ongoing to further develop the metric."),
              p("3. The score might underestimate impact in regions close to tipping, since it does not account for the potential effect of tipping points in accelerating environmental change."),
              p("The current version of the ESI does not explicitly account for measures normally associated with biodiversity impacts (e.g. mean species abundance, or potentially disappeared fraction of species)."),
              p("However, since the ESI captures some of the major well-established drivers of biodiversity loss (i.e. climate change and land use), and the interactions between them, it can be considered a good proxy for companies’ pressures on biodiversity.")
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
                src = "assets/images/inter3.png",
                alt = "ESI added value illustration",
                style = "max-width: 95%; height: auto; max-height: 70vh; object-fit: contain;"
              )
            )
          )
        )
      )
    )
  )
}

mod_storymap4_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # no server logic needed
  })
}