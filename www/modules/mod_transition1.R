mod_transition1_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    tags$div(
      class = "transition1-banner",
      style = "width: 100%; padding: 64px clamp(16px, 4vw, 64px);",
      
      tags$h2(
        "SCIENTIFIC FOUNDATIONS",
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
        
        # card 1
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
            tags$h2("Planetary Boundaries"),
            tags$p("the higher the ESI, the closer to the edge of the PB"),
            tags$img(
              src = "assets/images/PBs.png",
              alt = "PBs"
            )
          )
        ),
        
        # card 2
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
            tags$h2("Earth system interactions"),
            tags$p("three crucial inputs are aggregated into a single metric."),
            tags$img(
              src = "assets/images/interactions-simple.png",
              alt = "interactions-static"
            )
          )
        ),
        
        #  card 3
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
            tags$h2("Impacts on the Earth System are determined by location"),
            tags$img(
              src = "assets/images/location-new.png",
              alt = "corporate impacts"
            )
          )
        )
      ),
      
      tags$div(
        class = "transition1-text",
        style = "
          margin-top: 70px;
          text-align: justify;
          max-width: 900px;
          margin-left: auto;
          margin-right: auto;
        ",
        tags$p(
          "The Earth System Impact metric emerges from transdisciplinary collaboration across business, finance, and Earth system science, and is grounded in state-of-the-art sustainability research.",
          style = "
            margin: 0;
            line-height: 1.6;
          "
        )
      )
    )
  )
}

mod_transition1_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}