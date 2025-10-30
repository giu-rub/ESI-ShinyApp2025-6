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
              p("The Stockholm Resilience Center and the Australian National University invite you to explore the Earth System Impact (ESI) — a science-based tool launched in 2023 that helps highlight how corporate activities and investments influence the planet.")
            ),
            
          
          # The actual trigger for the INTRO scene on the right pane
          div(
            class = "story-step intro-trigger",
            `data-step` = "intro",         # server already renders this scene id
            `data-pane` = "1",             # activates Pane 1
            `data-activate-frac` = "0.40", # smaller = earlier; tweak 0.35–0.55 to taste
            `data-activate-anchor` = "top",
            `data-activate-offset` = "-30",
            div()                          # empty/invisible
          ),
          
          # 3) The rest of Pane 1 content comes after Intro
          div(
            class = "story-step",
            `data-step` = "interactions",
            `data-pane` = "1",
            div(
              h2("Climate, land and water: interconnected"),
              p("the impacts we have on the Earth exacerbate both climate and nature-related risks. If we don't fully understand the impact of externalities its harder to mitigate these risks")
            ),
              p("While reducing emissions remains a priority, there are other biophysical processes that are essential to the resilience of the Earth System"
                )
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
               p("We increasingly recognize nature-related risks, but the tools we use to capture environmental impact are lagging—too often reduced to either flawed ESG ratings or a single focus on carbon, leaving other important environmental dimensions invisible.")
             ),
            # p("If we don't fully understand the impact of externalities its harder to mitigate these risks."
             #  ),
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
