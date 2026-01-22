mod_transition1_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    tags$div(
      class = "transition1-banner",
      style = "width: 100%; padding: 64px clamp(16px, 4vw, 64px);",
      
      # Title
      tags$h2(
        "3 SCIENTIFIC ANCHORS",
        style = "
          margin-bottom: 40px;
          font-size: clamp(1.6rem, 3vw, 2.4rem);
          font-weight: 600;
          text-align: center;
        "
      ),
      
      # Three columns
      tags$div(
        style = "
          display: grid;
          grid-template-columns: repeat(3, 1fr);
          gap: 24px;
        ",
        
        # Card 1
        tags$div(
          class = "transition-card",
          role = "button",
          tabindex = "0",
          onclick = "
            const el = document.querySelector('[data-step=\"esi_financial\"]');
            if (el) {
              el.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
            Shiny.setInputValue(
              'storymap1-current_step',
              'esi_financial',
              { priority: 'event' }
            );
          ",
          tags$div(
            class = "transition-card-overlay",
            tags$h4("Financial Risk"),
            tags$p("double materiality and feedback loops"),
            tags$img(
              src = "assets/images/financial_risk.png",
              alt = "financial risk"
            )
          )
        ),
        
        # Card 2
        tags$div(
          class = "transition-card",
          role = "button",
          tabindex = "0",
          onclick = "
            const el = document.querySelector('[data-step=\"image\"]');
            if (el) {
              el.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
            Shiny.setInputValue(
              'storymap2-current_step',
              'image',
              { priority: 'event' }
            );
          ",
          tags$div(
            class = "transition-card-overlay",
            tags$h4("Planetary Boundaries"),
            tags$p("the higher the ESI, the closer to the edge of the PB"),
            tags$img(
              src = "assets/images/PBs.png",
              alt = "PBs"
            )
          )
        ),
        
        # Card 3
        tags$div(
          class = "transition-card",
          role = "button",
          tabindex = "0",
          onclick = "
            const el = document.querySelector('[data-step=\"interactions\"]');
            if (el) {
              el.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
            Shiny.setInputValue(
              'storymap3-current_step',
              'interactions',
              { priority: 'event' }
            );
          ",
          tags$div(
            class = "transition-card-overlay",
            tags$h4("Climate, Water and Land"),
            tags$p("three crucial inputs are aggregated into a single metric."),
            tags$img(
              src = "assets/images/ESI_interactions_5.png",
              alt = "interactions-static"
            )
          )
        )
      )
    )
  )
}
