mod_transition1_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      class = "transition1-banner",
     )
  )
}

mod_transition1_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}
