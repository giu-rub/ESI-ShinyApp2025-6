mod_message_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    div(
      class = "message-module",
      h2("Message to our visitors"),
      p("Despite these limitations, the ESI represents an important step forward in allowing companies and financial actors capture the impact of their assets in a more comprehensive way.
If you would like to test the use of ESI in your organization – feel free to reach out!
")
    )
  )
}

mod_message_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # no server logic needed
  })
}