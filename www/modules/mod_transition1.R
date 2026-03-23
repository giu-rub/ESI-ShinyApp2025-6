mod_transition1_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    tags$div(
      class = "transition1-banner",
      style = "width: 100%; padding: 64px clamp(16px, 4vw, 64px);",
      
      tags$h2(
        "SCIENTIFIC ANCHORS",
        style = "
          margin-bottom: 40px;
          font-size: clamp(1.6rem, 3vw, 2.4rem);
          font-weight: 600;
          text-align: center;
        "
      ),
      
      tags$div(
        style = "
          display: grid;
          grid-template-columns: repeat(3, 1fr);
          gap: 24px;
        ",
        
        tags$div(
          class = "transition-card",
          role = "button",
          tabindex = "0",
          onclick = "
            const el = document.getElementById('storymap-impact-importance');
            if (el) {
              el.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
          ",
          onkeydown = "
            if (event.key === 'Enter' || event.key === ' ') {
              event.preventDefault();
              const el = document.getElementById('storymap-impact-importance');
              if (el) {
                el.scrollIntoView({ behavior: 'smooth', block: 'start' });
              }
            }
          ",
          tags$div(
            class = "transition-card-overlay",
            tags$h2("Why is measuring corporate impacts on the Earth System important?"),
            tags$p("lorem ipsum"),
            tags$img(
              src = "assets/images/financial_risk.png",
              alt = "corporate impacts"
            )
          )
        ),
        
        tags$div(
          class = "transition-card",
          role = "button",
          tabindex = "0",
          onclick = "
            const el = document.getElementById('storymap2-safe-space');
            if (el) {
              el.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
          ",
          onkeydown = "
            if (event.key === 'Enter' || event.key === ' ') {
              event.preventDefault();
              const el = document.getElementById('storymap2-safe-space');
              if (el) {
                el.scrollIntoView({ behavior: 'smooth', block: 'start' });
              }
            }
          ",
          tags$div(
            class = "transition-card-overlay",
            tags$h2("How is the ESI related to the Planetary Boundaries?"),
            tags$p("the higher the ESI, the closer to the edge of the PB"),
            tags$img(
              src = "assets/images/PBs.png",
              alt = "PBs"
            )
          )
        ),
        
        tags$div(
          class = "transition-card",
          role = "button",
          tabindex = "0",
          onclick = "
            const el = document.getElementById('storymap2-interactions');
            if (el) {
              el.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
          ",
          onkeydown = "
            if (event.key === 'Enter' || event.key === ' ') {
              event.preventDefault();
              const el = document.getElementById('storymap2-interactions');
              if (el) {
                el.scrollIntoView({ behavior: 'smooth', block: 'start' });
              }
            }
          ",
          tags$div(
            class = "transition-card-overlay",
            tags$h2("How does the ESI consider Climate, Water and Land interactions?"),
            tags$p("three crucial inputs are aggregated into a single metric."),
            tags$img(
              src = "assets/images/interactions-simple.png",
              alt = "interactions-static"
            )
          )
        )
      )
    )
  )
}

mod_transition1_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}