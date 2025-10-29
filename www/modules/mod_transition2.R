

mod_transition2_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      class = "transition2-banner",
      
      # 🎥 Background video
      tags$video(
        class = "background-video",
        autoplay = NA,
        muted = NA,
        loop = NA,
        playsinline = NA,
        # optional: preload = "auto",
        tags$source(src = "assets/images/iceland_midpage.mp4", type = "video/mp4"),
        "Your browser does not support the video tag."
      ),
      
      # Overlay content
      div(
       class = "transition2-overlay",
        p("What happens to the climate, land and water next to your assets? ")
     )
    )
  )
}

mod_transition2_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}
