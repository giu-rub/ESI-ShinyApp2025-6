mod_intro_ui <- function(id) {
  ns <- NS(id)
  tagList(
    tags$div(
      style = "position: relative; width: 100vw; height: 100vh; overflow: hidden; margin: 0; padding: 0;",
      
      # Background video (fills the container)
      tags$video(
        id = ns("bg_video"),
        src = "assets/images/ss_sand.mov",
        autoplay = NA,
        muted = NA,
        loop = NA,
        playsinline = NA,
        style = "
          position: absolute;
          inset: 0;
          width: 100%;
          height: 100%;
          object-fit: cover;
          z-index: -1;
        "
      ),
      
      # Centered overlay content
      tags$div(
        style = "
          position: absolute; inset: 0;
          display: flex; flex-direction: column;
          align-items: center; justify-content: center;
          text-align: center; color: white; z-index: 1;
        ",
        h1("The Earth System Impact tool"),
        p("What is the impact of your activity on water, land and climate?")
      
      ),
      
      tags$h6(
        "Video credit: Ira Belsky",
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
      ),
      
      # Control playback speed
      tags$script(HTML(sprintf("
        document.addEventListener('DOMContentLoaded', function() {
          var video = document.getElementById('%s');
          if (video) video.playbackRate = 0.7;
        });
      ", ns("bg_video"))))
    )
  )
}

mod_intro_server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}
