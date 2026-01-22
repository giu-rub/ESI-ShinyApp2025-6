mod_transition3_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      class = "transition3-banner",
      `data-step` = "esi_toolbox",
      style = "
    width: 100%;
    padding: 64px clamp(16px, 4vw, 64px);
  ",
      
      tags$h2(
        "ESI TOOLBOX",
        style = "
          font-size: clamp(1.6rem, 3vw, 2.4rem);
          font-weight: 600;
          text-align: center;
        "
      ),
    )
  )
}

mod_transition3_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}