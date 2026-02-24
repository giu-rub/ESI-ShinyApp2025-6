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
          gap: 40px;
        ",
        
        # ---- TEXT BLOCK ----
        div(
          h2("Financial Risk in the Earth System"),
          p("Corporations are responsible for a significant portion of impacts on the Earth system, including greenhouse gas emissions, water extraction, land use and other pressures on Nature."),
          p("These increasing pressures contribute to exacerbating climate and nature-related financial risks. Yet, the tools used in business and finance to capture environmental impact are too often reduced to flawed ESG ratings or a single focus on carbon, leaving other important environmental dimensions invisible."),
          p("The ESI is a metric of environmental impact that addresses this gap by going beyond simple measures of carbon dioxide emissions and accounting for more of the complexity of the Earth System.")
        ),
        
        # ---- IMAGE BELOW ----
        tags$img(
          src = "assets/images/financial_risk.png",  # <-- adjust to your image path
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