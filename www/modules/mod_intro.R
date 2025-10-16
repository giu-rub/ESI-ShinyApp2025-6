mod_intro_ui <- function(id) {
  ns <- NS(id)
  tagList(
    tags$div(
      style = "position: relative; width: 100vw; height: 85vh; overflow: hidden; margin: 0; padding: 0;",
      
      # Background video (fills the screen)
      tags$video(
        id = ns("bg_video"),
        src = "assets/images/intro_tunnel_clouds.mp4",
        autoplay = NA,
        muted = NA,
        loop = NA,
        playsinline = NA,
        style = "
          position: absolute;
          top: 0;
          left: 0;
          width: 100vw;
          height: 80vh;
          overflow: hidden;  
          object-fit: cover;
          z-index: -1;
        "
      ),
      
      # Overlayed content
      tags$div(
        style = "position: relative; z-index: 1; text-align: center; color: black; padding-top: 200px;",
        h1("The Earth System Impact tool"),
        p("Are the impacts of your assets within Planetary Boundaries?"),
        
        # Control playback speed
        tags$script(HTML(sprintf("
          document.addEventListener('DOMContentLoaded', function() {
            var video = document.getElementById('%s');
            if (video) video.playbackRate = 0.7;
          });
        ", ns("bg_video"))))
      )
    )
  )
} 
