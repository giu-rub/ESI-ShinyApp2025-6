mod_transition1b_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      class = "transition1b-banner",
    )
  )
}

mod_transition1b_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}
