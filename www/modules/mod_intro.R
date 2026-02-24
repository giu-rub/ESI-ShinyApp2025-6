mod_intro_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    tags$head(
      tags$style(HTML("
        @media (max-width: 600px) {
          h1 {
            white-space: normal !important;
            font-size: clamp(1.4rem, 5vw, 2rem) !important;
            line-height: 1.2 !important;
          }
        }

   .intro-bg {
  background-attachment: fixed;
}

        .btn-primary {
          background-color: transparent;
          color: #000;
          border: 1px solid rgba(255,255,255,0.8);
        }

        .btn-outline-light {
          background: transparent;
          color: #000;
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
        display: flex;
        align-items: center;
        justify-content: flex-start;
        padding: clamp(16px, 4vw, 48px);
        color: black;
    
      
        
         background-image: url('assets/images/Glass1.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
      ",
      
      # Content container
      tags$div(
        style = "
    max-width: 1200px;
    width: 100%;
  ",
        
        tags$div(
          style = "
      display: flex;
      align-items: flex-start;
      justify-content: space-between;
      gap: 40px;
      width: 100%;
    ",
          
          # Left: title + subtitle
          tags$div(
            style = "
        flex: 1 1 auto;
        min-width: 0;
      ",
            h1(
              "The Earth System Impact tool",
              style = "
          font-size: clamp(1.8rem, 5vw, 3.5rem);
          font-weight: 700;
          line-height: 1.15;
          margin: 0;
        "
            ),
            p(
              "Quantifying businesses' impacts on water, land and climate.",
              style = "
          font-size: clamp(1rem, 2vw, 1.5rem);
          margin: 12px 0 0 0;
          max-width: 60ch;
        "
            )
          ),
          
          # Right: stacked buttons
          tags$div(
            style = "
    display: flex;
    flex-direction: column;
    gap: 50px;
    flex: 0 0 auto;
    align-self: center;
  ",
            tags$button(
              "TEST TOOLS",
              class = "btn-primary intro-btn ",
              onclick = "
    const el = document.querySelector('[data-step=\"esi_toolbox\"]');
    if (el) {
      el.scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
    Shiny.setInputValue(
      'intro-test_tool',
      true,
      { priority: 'event' }
    );
  "
            ),
            
            tags$button(
              "EXPLORE THE ESI",
              class = "btn-outline-light intro-btn",
              onclick = "
    const el = document.querySelector('[data-step=\"esi_tool_intro\"]');
    if (el) {
      el.scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
    Shiny.setInputValue(
      'intro-explore',
      true,
      { priority: 'event' }
    );
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