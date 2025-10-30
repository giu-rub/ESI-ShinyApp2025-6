mod_storymap3_ui <- function(id) {
  ns <- NS(id)
  tagList(
    # (No head assets here; included by Pane 1)
    div(
      class = "storymap-root",
      id = ns("root"),
      `data-ns` = ns(""),
      
      div(
        class = "storymap-wrap",
        
        # LEFT COLUMN: steps -> Pane 3
        div(
          class = "story-column",
          
          # ON-RAMP: delays Pane 3 activation so it doesn't trigger too early
          div(
            class = "story-step on-ramp",
            `data-step` = "mod_storymap3.R_on",
            `data-pane` = "off",
            `data-activate-frac` = "0.9",  # raise to delay more (e.g., 0.6–0.7)
            div()
          ),
          
          # First (and main) Pane-3 step
          div(
            class = "story-step",
            `data-step` = "closing",
            `data-pane` = "3",
            `data-activate-frac` = "0.9",  # triggers later; lower to trigger earlier
            `data-activate-anchor` = "top", # anchor at step TOP so it doesn't win too soon
            div(
              h2("Hook to EU regulation"),
              p("Laws are changing, and so should your business accounting!")
            )
          ),
          
          # OFF-RAMP: clears Pane 3 before you reach the next section / transition3
          div(
            class = "story-step off-ramp",
            `data-step` = "mod_storymap3.R_off",
            `data-pane` = "off",            # JS clears all panes here
            `data-activate-frac` = "0.15",  # kicks in early on the way up
            div()
          )
        ),
        
        # RIGHT FIXED STICKY PANE (Pane 3)
        div(
          class = "sticky-pane",
          `data-pane` = "3",
          div(class = "scene-frame", uiOutput(ns("scene3")))
        )
      )
    )
  )
}

mod_storymap3_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    current_step <- reactiveVal(NULL)
    
    observeEvent(input$current_step, ignoreInit = TRUE, {
      current_step(input$current_step)
    })
    
    output$scene3 <- renderUI({
      step <- current_step()
      if (is.null(step) || step == "mod_storymap3.R_off") return(NULL)  # ensure it untriggers
      
      switch(step,
             "closing" = tags$div(
               h2("What can you do?"),
               p("Assess your company's impact on the planet. Start from using the ESI tool.")
             ),
             NULL
      )
    })
  })
}
