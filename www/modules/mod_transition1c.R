mod_transition1c_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    tags$div(
      class = "transition1c-banner",
      `data-step` = "esi_tool_intro",
      style = "
    width: 100%;
    padding: 64px clamp(16px, 4vw, 64px);
  ",
      
      
      tags$h2(
        "THE ESI",
        style = "
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
