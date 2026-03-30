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
            id = "storymap4-block-limit",
            class = "story-static-section",
            style = "scroll-margin-top: 140px;",
            div(
              class = "esi-section2",
              h2("Limitations"),
              p("The ESI provides an integrated assessment of the planetary scale impacts of water use, land use and GHG emissions, three key drivers of biodiversity loss and change. However, users are advised to use it alongside other impact assessment measures to get a holistic picture and to ensure critical environmental impacts of relevance for your assets/projects are not missed."),
              p("The ESI score can be seen as a step forward in measuring impact on the planet in an integrated way. But, like all tools, it still has limitations."),
              p("For example:"),
              p("1. The ESI is regionally aggregated and focuses on impacts at a planetary scale. It can (and should) not replace local environmental impact assessments, since it cannot capture important considerations such as water and air pollution, or local biodiversity impacts."),
              p("2. The score captures three Earth System components, and four of their interactions. Many other dimensions could be included, and work is ongoing to further develop the metric."),
              p("3. The ESI score could underestimate the impact in regions close to their tipping points, since it does not account for the potential effect of tipping points in accelerating environmental change."),
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
                src = "assets/images/limit.png",
                alt = "ESI limitations",
                style = "max-width: 95%; height: auto; max-height: 70vh; object-fit: contain;"
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