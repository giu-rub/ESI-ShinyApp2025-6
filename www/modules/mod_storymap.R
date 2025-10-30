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
            `data-step` = "intro_text",   # any unique id; server does not use it
            `data-pane` = "off",
            div(
              h2("Welcome!"),
              p("Welcome! The Global Economic Dynamics and the Biosphere programme (GEDB) invites you to explore the Earth System Impact (ESI) — a science-based tool launched in 2023 that shows how corporate and investment activities influence the planet’s interconnected systems of climate, land, and water.")
            )
          ),
          
          # 2) The actual trigger for the INTRO scene on the right pane
          #    Put this immediately after the welcome block so Intro scene
          #    activates right after the welcome text.
          div(
            class = "story-step intro-trigger",
            `data-step` = "intro",         # server already renders this scene id
            `data-pane` = "1",             # activates Pane 1
            `data-activate-frac` = "0.40", # smaller = earlier; tweak 0.35–0.55 to taste
            div()                          # empty/invisible
          ),
          
          # 3) The rest of Pane 1 content comes after Intro
          div(
            class = "story-step",
            `data-step` = "interactions",
            `data-pane` = "1",
            div(
              h2("Some science to keep in mind"),
              p("Here you can learn how the three systems interact on the planet.")
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
      
      switch(step,
             "intro" = tags$div(
               h1("Intro scene"),
               p("Maybe a map with 2D globe and pictures of who is working on this — some connections across the globe and little pop-ups.")
             ),
             "interactions" = tags$img(
               src = "assets/images/ESI_interactions_5.png",
               alt = "ESI interactions",
               style = "max-width:100%; max-height:80vh;"
             ),
             NULL
      )
    })
  })
}
