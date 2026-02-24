mod_storymap2_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    tags$head(
      tags$link(rel = "stylesheet", href = "esi.css")
    ),
    
    div(
      class = "storymap2-static",
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
          color: #FFF8F1;
        ",
        
        # -------- BLOCK 1: Planetary Boundaries --------
        div(
          style = "
            display: flex;
            flex-direction: column;
            gap: 32px;
          ",
          
          div(
            style = "
              text-align: justify;
              text-justify: inter-word;
              hyphens: auto;
            ",
            h2("Planetary Boundaries", style = "text-align: center; margin: 0 0 1.25rem 0;"),
            p("The Planetary Boundaries framework is a useful starting point to better grasp the complexity of how human pressures affect the Earth System."),
            p("The Planetary Boundary framework sets ‘safe’ global limits across 9 key Earth System processes. Beyond these limits, the Earth may not be able to continue to self-regulate, and leave the period of stability of the Holocene, in which human society developed."),
            p("Transgressing one or more planetary boundaries can increase the risk of triggering non-linear, abrupt and potentially irreversible environmental change, setting in motion self-reinforcing feedbacks that amplify each other and push the Earth towards increasingly warmer temperatures.")
          ),
          
          tags$img(
            src = "assets/images/PBs.png",
            alt = "Planetary Boundaries",
            style = "
              width: 100%;
              max-width: 700px;
              height: auto;
              margin: 0 auto;
              display: block;
            "
          )
        ),
        
        # -------- BLOCK 2: Interactions --------
        div(
          style = "
            display: flex;
            flex-direction: column;
            gap: 32px;
          ",
          
          div(
            style = "
              text-align: justify;
              text-justify: inter-word;
              hyphens: auto;
            ",
            h2("Climate, land and water: interconnected", style = "text-align: center; margin: 0 0 1.25rem 0;"),
            p("But these boundaries are not isolated in siloes. They interact with each other and can amplify the effect of human impacts on the Earth System."),
            p("For example, changes in climate and CO2 concentrations:"),
            tags$ul(
              style = "text-align: left; max-width: 65ch; margin: 0 auto;",
              tags$li("impact the water cycle by affecting rainfall distributions"),
              tags$li("affect vegetation through temperature and rainfall changes")
            ),
            p("Land degradation:"),
            tags$ul(
              style = "text-align: left; max-width: 65ch; margin: 0 auto;",
              tags$li("impact the climate, through release of greenhouse gases"),
              tags$li("affects water runoff, through changing soil penetration")
            )
          ),
          
          tags$img(
            src = "assets/images/interactions.png",
            alt = "Climate, land and water interactions",
            style = "
              width: 100%;
              max-width: 700px;
              height: auto;
              margin: 0 auto;
              display: block;
            "
          )
        )
      )
    )
  )
}

mod_storymap2_server <- function(id) {
  moduleServer(id, function(input, output, session) {
  })
}