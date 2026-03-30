mod_about_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    tags$head(
      tags$link(rel = "stylesheet", href = "esi.css")
    ),
    
    tags$section(
      id = "about-section",
      style = "
        width: 100%;
        padding: 64px clamp(16px, 4vw, 64px);
      ",
      
      tags$div(
        style = "
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 32px;
          align-items: center;
        ",
        
        # LEFT: title + text
        tags$div(
          tags$h2(
            "About the Earth System Impact Metric",
            style = "
              margin-bottom: 16px;
             
              font-weight: 600;
            "
          ),
          
          tags$p(
            "The ESI represents an advancement in assessing human impacts on the planet, as it captures three important and distinct features of Earth System dynamics. The Earth System Impact Metric (ESI):",
            style = "
              margin-bottom: 1rem;
           
              line-height: 1.6;
            "
          ),
          
          tags$ol(
            style = "
              
              line-height: 1.6;
              padding-left: 1.5rem;
              margin-bottom: 1rem;
            ",
            
            tags$li(
              tags$strong("Goes beyond carbon"),
              tags$br(),
              "Captures impacts on multiple Earth System components (currently climate, vegetation and water), in relation to their regional 'safe operating space', as outlined by the Planetary Boundaries."
            ),
            
            tags$li(
              tags$strong("Recognizes Earth system interactions"),
              tags$br(),
              "Accounts for key interactions among these Earth System components, measuring how impacts on one, such as climate change, affect other components, such as vegetation."
            ),
            
            tags$li(
              tags$strong("Is context-sensitive"),
              tags$br(),
              "Distinguishes how impacts on the Earth System vary depending on where on the planet they occur."
            )
          ),
          
          tags$p(
            "In the next sections we explore these features in more detail.",
            style = "
              margin: 0;
           
              line-height: 1.6;
            "
          )
        ),
        
        # RIGHT: image
        tags$div(
          style = "display: flex; justify-content: center;",
          tags$img(
            src = "assets/images/esi-logo-new-dark.png",
            alt = "esi logo",
            style = "
              max-width: 80%;
              height: auto;
              border-radius: 12px;
            "
          )
        )
      )
    )
  )
}

mod_about_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}

mod_about_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}