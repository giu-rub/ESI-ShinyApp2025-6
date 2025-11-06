mod_intro_ui <- function(id) {
  ns <- NS(id)
  tagList(
    # Mobile override: allow h1 to wrap & scale down on small screens
    tags$head(
      tags$style(HTML("
        @media (max-width: 600px) {
          h1 {
            white-space: normal !important;
            overflow: visible !important;
            text-overflow: clip !important;
            font-size: clamp(1.4rem, 5vw, 2rem) !important;
            line-height: 1.2 !important;
          }
        }
      "))
    ),
    
    tags$div(
      style = "position: relative; width: 100vw; height: 100vh; overflow: hidden; margin: 0; padding: 0;",
      
      # Background video (fills the container)
      tags$video(
        id = ns("bg_video"),
        src = "assets/images/intro_es.mov",
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
    align-items: flex-start;           /* left-align the block elements */
    justify-content: center;           /* vertical centering; switch to flex-start for top-left */
    color: white; z-index: 1;
    padding: clamp(16px, 4vw, 48px);
    text-align: left;
    max-width: min(68ch, 92vw);
    gap: clamp(8px, 1.5vw, 16px);
        ",
        h1("The Earth System Impact tool", style = "
    font-size: clamp(1.8rem, 5vw, 3.5rem);
    font-weight: 700;
    line-height: 1.15;
    margin: 0;
    white-space: nowrap;          
    overflow: hidden;           
    text-overflow: ellipsis;
  "),
        p("A prototype metric to assess the impact of your business on water, land and climate", style = "font-size: clamp(1rem, 2vw, 1.5rem); max-width: 800px;")
        
      ),
      
      tags$h6(
        "Video credit:  
Bruno Tornielli",
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
