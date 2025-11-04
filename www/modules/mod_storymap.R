mod_storymap_ui <- function(id) {
  ns <- NS(id)
  tagList(
    # Include global assets once (first pane)
    tags$head(
      tags$link(rel = "stylesheet", href = "esi.css"),
      tags$script(src = "assets/js/scroll-observer.js")
    ),
    div(
      class = "storymap-root",
      id = ns("root"),
      `data-ns` = ns(""),
      div(
        class = "storymap-wrap",
        
        # LEFT COLUMN: steps -> Pane 1
        div(
          class = "story-column",
          
          # 1) Visible welcome text (does NOT trigger the right pane)
          div(
            class = "story-step",
            `data-step` = "intro_text", 
            `data-pane` = "off",
            div(
              h2("Welcome!"),
              p("The Stockholm Resilience Center and the Australian National University invite you to explore the Earth System Impact (ESI) tool: a science-based platform launched in 2023 that helps you assess how your corporate activities and investments influence water, land and climate across the planet.")
            )
          ),
          
          # The actual trigger for the INTRO scene on the right pane
          div(
            class = "story-step intro-trigger",
            `data-step` = "intro",         
            `data-pane` = "1",             
            `data-activate-frac` = "0.30", # smaller = earlier; tweak 0.35–0.55 to taste
            `data-activate-anchor` = "top",
            `data-activate-offset` = "-30",
            div()                          
          ),
          
          # 3) The rest of Pane 1 content comes after Intro
          div(
            class = "story-step",
            `data-step` = "interactions",
            `data-pane` = "1",
            div(
              h2("Climate, land and water: interconnected"),
              p("In order to stay within the 9 Planetary Boundaries, we need to reduce the impact of our economic activities on the Earth system. In finance, we increasingly recognize that externalities contribute to nature-related risk, but measuring their impact is still a global challenge."),
              p("The tools we use to capture environmental impact are lagging behind, and they too often reduced to a single focus on carbon."),
              p("While reducing CO2 emissions remains a priority, there are other biophysical processes that are essential to the resilience of the Earth System: Land and Water.")
            )
          )
        ),
        
        # RIGHT FIXED STICKY PANE (Pane 1)
        div(
          class = "sticky-pane",
          `data-pane` = "1",
          div(class = "scene-frame", uiOutput(ns("scene1")))
        )
      ),
      
      # OFF-RAMP step to clear panes before transition1 (kept)
      div(
        class = "story-step off-ramp",
        `data-step` = "off_mod_storymap.R",
        `data-pane` = "off",
        div()
      )
    )
  )
}

mod_storymap_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # Start with no step selected; JS will activate 'intro' when its trigger is reached
    current_step <- reactiveVal(NULL)
    
    observeEvent(input$current_step, ignoreInit = TRUE, {
      current_step(input$current_step)
    })
    
    output$scene1 <- renderUI({
      step <- current_step()
      if (is.null(step)) return(NULL)
      
      switch(
        step,
        
        "intro" = tags$div(
          h1("Something"),
          p("something else")
        ),
        
        "interactions" = div(
          style = "
            display: flex;
            justify-content: flex-end;
            align-items: center;
            width: 100%;
          ",
          tags$video(
            autoplay = NA,
            muted = NA,
            loop = NA,
            playsinline = NA,
            src = 'assets/images/ESI_interactions_animated.mov',
            alt = 'Climate, land and water interactions.',
            style = '
              width: 95%;
              height: auto;
              object-fit: contain;
              max-height: 90vh;
            '
          )
        ),
        
        NULL
      )
    })
  })
}
