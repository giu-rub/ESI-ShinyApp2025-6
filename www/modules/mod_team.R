mod_team_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    div(
      class = "team-section",
      
      # Title
      h2("Our team"),
      
      # Flexbox container (empty for now)
      div(
        class = "team-flex",
        # content goes here later
      )
    )
  )
}


mod_downloads_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}
