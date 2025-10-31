mod_transition1c_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      class = "transition1c-banner",
    )
  )
}

mod_transition1c_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}
