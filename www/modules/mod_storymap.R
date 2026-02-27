mod_storymap_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    tags$head(
      tags$link(rel = "stylesheet", href = "esi.css")
    ),
    
    div(
      class = "storymap1-static",
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
        
        # ---- TEXT BLOCK ----
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
            h2("Why measuring corporate impacts on the Earth System is important"),
            p("Economic activities contribute substantially to the environmental pressures on the planet. Combined, these impacts can exacerbate climate and nature-related financial risks by threatening the stability of the Earth System.
            So what can investors and businesses do?
            Understanding and reducing impacts is key to managing increasing risks. Until recently, corporate environmental performance indicators focused primarily on GHG emissions, often neglecting other environmental aspects, such as water and land use, and ignoring the importance of localized impact. 
            The ESI metric addresses this gap by measuring the global Earth System impact of local business or other human activities. It extends beyond carbon emissions to also include the effects of water and land use, as well as how the interactions between climate, water and land use affect environmental outcomes.
            "),
          )
        ),
        
        # ---- IMAGE BELOW ----
        tags$img(
          src = "assets/images/financial_risk.png",
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
}

mod_storymap_server <- function(id) {
  moduleServer(id, function(input, output, session) {
  })
}