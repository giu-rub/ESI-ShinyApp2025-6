mod_transition2_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      class = "transition2-banner",
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
        p("How can science help you address financial risk?")
      ),
      
      # Video credit
      tags$h6(
        "Video credit: Artlist",
        style = "
          position: absolute;
          bottom: 10px;
          right: 25px;
          font-size: 0.6rem;
          color: white;
          opacity: 0.85;
          margin: 0;
          z-index: 2;
        "
      )
    )
  )
}

mod_transition2_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}