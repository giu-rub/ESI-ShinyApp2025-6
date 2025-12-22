mod_transition1c_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    tags$div(
      class = "transition1-banner",
      style = "
        width: 100%;
        padding: 64px clamp(16px, 4vw, 64px);
      ",
      
      # Title
      tags$h2(
        "The Earth System Impact Tool",
        style = "
          margin-bottom: 40px;
          font-size: clamp(1.6rem, 3vw, 2.4rem);
          font-weight: 600;
          text-align: center;
        "
      ),
  
    )
  )
}

mod_transition1c_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}
