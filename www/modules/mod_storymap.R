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
        
        #here i added this div
        div(
          id = "storymap-impact-importance",
          style = "
            display: flex;
            flex-direction: column;
            gap: 32px;
            scroll-margin-top: 140px;
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
            h2("Estimating global effects of local impacts"),
            
            tags$div(
              style = "
    text-align: justify;
    text-justify: inter-word;
    hyphens: auto;
  ",
              
              p("Global environmental effects of local pressures can vary dramatically depending on where they occur. For example:"),
              
              p("Tropical forests store large amounts of above-ground carbon, which is released into the atmosphere when they are cleared. So, land use in those areas generally leads to higher interaction impacts on climate."),
              
              p("At the same time, if the area of a particular type of vegetation is very small, such as cool grasslands in Africa, further land use in those regions will lead to higher impacts, since it risks leading to the loss of that ecosystem."),
              
              p("Similarly, water consumption can have a larger impact in arid regions already experiencing water scarcity than in water-abundant locations."),
              
              p(
                "By capturing spatial differences in impacts, total availability, and the interactions between water use, land use, and climate, the ",
                tags$strong("ESI provides a way to assess how companies' local environmental impacts translate into global Earth System effects.")
              )
            )
          )
        ),
        
        # ---- IMAGE BELOW ----
        tags$img(
          src = "assets/images/location-new.png",
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

mod_storymap_server <- function(id) {
  moduleServer(id, function(input, output, session) {
  })
}