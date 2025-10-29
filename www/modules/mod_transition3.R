mod_transition3_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      class = "transition3-banner",
      
      # 🎥 Background video
      tags$video(
        class = "background-video",
        autoplay = NA,
        muted = NA,
        loop = NA,
        playsinline = NA,
        # optional: preload = "auto",
        tags$source(src = "assets/images/cloud_formation.mov", type = "video/mp4"),
        "Your browser does not support the video tag."
      ),
      
      # 🧱 Overlay content
      div(
        class = "transition3-overlay",
        p("How do your impacts spread across the planet?")
      ),
      
      # Video credit
      tags$h6(
        "Video credit: Dubassy",
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

mod_transition3_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}
