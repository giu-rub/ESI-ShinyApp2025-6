mod_storymap3_ui <- function(id) {
  ns <- NS(id)
  tagList(
    # No head assets here (already included by Pane 1)
    div(
      class = "storymap-root",
      id = ns("root"),
      `data-ns` = ns(""),
      div(
        class = "storymap-wrap",
        # LEFT COLUMN: steps -> Pane 3
        div(
          class = "story-column",
          div(
            class = "story-step",
            `data-step` = "closing",
            `data-pane` = "3",
            div(
              h2("Hook to EU regulation"),
              p("Laws are changing, and so should your business accounting!")
            )
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
    current_step <- reactiveVal("closing")
    observeEvent(input$current_step, ignoreInit = TRUE, {
      current_step(input$current_step)
    })
    output$scene3 <- renderUI({
      switch(current_step(),
             "closing" = tags$div(
               h2("What can you do?"),
               p("Assess your company's impact on the planet. Start from using the ESI tool.")
             ),
             NULL
      )
    })
  })
}
