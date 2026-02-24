mod_intro_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    tags$head(
      tags$style(HTML("
        @media (max-width: 768px) {
          .intro-row {
            flex-direction: column;
            text-align: center;
          }
          .intro-buttons {
            align-items: center !important;
          }
        }

        .btn-primary,
        .btn-outline-light {
          background-color: transparent;
          color: #FFF8F1;
          border: 1px solid rgba(255,255,255,0.8);
        }

        .btn-primary:hover,
        .btn-outline-light:hover {
          opacity: 0.85;
        }
      "))
    ),
    
    tags$div(
      class = "intro-bg",
      style = "
        position: relative;
        width: 100vw;
        height: 100vh;
        overflow: hidden;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: clamp(16px, 4vw, 48px);
        color: #FFF8F1;
      ",
      
      # Background video
      tags$video(
        autoplay = NA,
        muted = NA,
        loop = NA,
        playsinline = NA,
        preload = "auto",
        style = "
          position: absolute;
          inset: 0;
          width: 100%;
          height: 100%;
          object-fit: cover;
          z-index: 0;
        ",
        tags$source(
          src = "assets/images/iceland_intro.mp4",
          type = "video/mp4"
        )
      ),
      
      # Optional overlay for readability
      tags$div(
        style = "
          position: absolute;
          inset: 0;
          background: rgba(0,0,0,0.35);
          z-index: 1;
        "
      ),
      
      # Foreground content
      tags$div(
        style = "
          position: relative;
          z-index: 2;
          width: 100%;
          max-width: 1200px;
        ",
        
        tags$div(
          class = "intro-row",
          style = "
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 80px;
            width: 100%;
          ",
          
          # Left side: title + subtitle
          tags$div(
            style = "
              flex: 1;
              min-width: 0;
            ",
            h1(
              "The Earth System Impact score",
              style = "
                font-size: clamp(2rem, 5vw, 3.5rem);
                font-weight: 700;
                line-height: 1.15;
                margin: 0;
              "
            ),
            p(
              "Quantifying businesses' impacts on water, land and climate.",
              style = "
                font-size: clamp(1rem, 2vw, 1.5rem);
                margin: 16px 0 0 0;
                max-width: 70ch;
              "
            )
          ),
          
          # Right side: stacked buttons
          tags$div(
            class = "intro-buttons",
            style = "
        flex: 0 0 260px;    
        min-width: 240px;
        display: flex;
        flex-direction: column;
        gap: 24px;
        align-items: flex-start;
      ",
            tags$button(
              "TOOLBOX",
              class = "btn-primary intro-btn",
              onclick = "
                const el = document.querySelector('[data-step=\"esi_toolbox\"]');
                if (el) el.scrollIntoView({ behavior: 'smooth', block: 'start' });
                Shiny.setInputValue('intro-test_tool', true, { priority: 'event' });
              "
            ),
            tags$button(
              "THE ESI",
              class = "btn-outline-light intro-btn",
              onclick = "
                const el = document.querySelector('[data-step=\"esi_tool_intro\"]');
                if (el) el.scrollIntoView({ behavior: 'smooth', block: 'start' });
                Shiny.setInputValue('intro-explore', true, { priority: 'event' });
              "
            )
          )
        )
      )
    )
  )
}

mod_intro_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}