mod_storymap4_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    tags$head(
      tags$style(HTML("
        .story-static-section {
          scroll-margin-top: 140px;
        }
      "))
    ),
    
    div(
      class = "storymap-root storymap4",
      id = ns("root"),
      
      div(
        style = "
          width: 100%;
          padding: clamp(40px, 6vw, 100px) 16px;
          display: flex;
          justify-content: center;
        ",
        
        div(
          style = "
            width: 100%;
            max-width: 900px;
            text-align: center;
            display: flex;
            flex-direction: column;
            gap: 70px;
          ",
          
          
          div(
            id = "storymap4-block-why",
            class = "story-static-section",
            style = "
              display: flex;
              flex-direction: column;
              gap: 32px;
            ",
            
            div(
              class = "esi-section",
              style = "
                text-align: justify;
                text-justify: inter-word;
                hyphens: auto;
              ",
              h2("Why measuring corporate impacts on the Earth System is important"),
              p("Economic activities contribute substantially to the environmental pressures on the planet. Combined, these impacts can exacerbate climate and nature-related financial risks by threatening the stability of the Earth System."),
              p("So what can investors and businesses do?"),
              p("Understanding and reducing impacts is key to managing increasing risks. Until recently, corporate environmental performance indicators focused primarily on GHG emissions, often neglecting other environmental aspects, such as water and land use, and ignoring the importance of localized impact."),
              p("The ESI metric addresses this gap by measuring the global Earth System impact of local business or other human activities. It extends beyond carbon emissions to also include the effects of water and land use, as well as how the interactions between climate, water and land use affect environmental outcomes.")
            ),
            
            div(
              class = "esi-image-section",
              tags$img(
                src = "assets/images/financial_risk.png",
                alt = "Measuring corporate impacts",
                style = "
                  width: 100%;
                  max-width: 700px;
                  height: auto;
                  margin: 0 auto;
                  display: block;
                "
              )
            )
          ),
          
          div(
            id = "storymap4-block-limit",
            class = "story-static-section",
            style = "
              display: flex;
              flex-direction: column;
              gap: 32px;
            ",
            
            div(
              class = "esi-section2",
              style = "
                text-align: justify;
                text-justify: inter-word;
                hyphens: auto;
              ",
              h2("Limitations"),
              p("The ESI provides an integrated assessment of the planetary scale impacts of water use, land use and GHG emissions, three key drivers of biodiversity loss and change. However, users are advised to use it alongside other impact assessment measures to get a holistic picture and to ensure critical environmental impacts of relevance for your assets/projects are not missed."),
              p("The ESI score can be seen as a step forward in measuring impact on the planet in an integrated way. But, like all tools, it still has limitations."),
              p("For example:"),
              p("1. The ESI is regionally aggregated and focuses on impacts at a planetary scale. It can (and should) not replace local environmental impact assessments, since it cannot capture important considerations such as water and air pollution, or local biodiversity impacts."),
              p("2. The score captures three Earth System components, and four of their interactions. Many other dimensions could be included, and work is ongoing to further develop the metric."),
              p("3. The ESI score could underestimate the impact in regions close to their tipping points, since it does not account for the potential effect of tipping points in accelerating environmental change."),
              p("Despite these limitations, the ESI represents an important step forward in allowing companies and financial actors capture the impact of their assets in a more comprehensive way.
If you would like to test the use of ESI in your organization – feel free to reach out!")
            )
          )
        )
      )
    )
  )
}

mod_storymap4_server <- function(id) {
  moduleServer(id, function(input, output, session) {
  })
}