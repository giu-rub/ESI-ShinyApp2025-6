mod_storymap2_ui <- function(id) {
  ns <- NS(id)
  tagList(
    # No head assets here (already included by Pane 1)
    div(
      class = "storymap-root",
      id = ns("root"),
      `data-ns` = ns(""),
      
      div(
        class = "storymap-wrap",
        
        # LEFT COLUMN: steps -> Pane 2
        div(
          class = "story-column",
          
          # (Optional) ON-RAMP to delay Pane 2 turning on
          # div(
          #   class = "story-step on-ramp",
          #   `data-step` = "pane2_onramp",
          #   `data-pane` = "off",
          #   div()
          # ),
          
          # First Pane-2 step
          div(
            class = "story-step",
            `data-step` = "image",
            `data-pane` = "2",
            `data-activate-frac` = "0.9",
            div(
              h2("Planetary Boundaries"),
              p("Here you understand what the planetary consequences of not doing this are.")
            )
          ),
          
          # Second Pane-2 step
          div(
            class = "story-step",
            `data-step` = "halloween",
            `data-pane` = "2",
            div(
              h2("Hook to EU regulation"),
              p("Laws are changing, and so should your business accounting!")
            )
          ),
          
          # OFF-RAMP to clear Pane 2 BEFORE transition2 arrives
          div(
            class = "story-step off-ramp",
            `data-step` = "mod_storymap2.R_off",
            `data-pane` = "off",           
            `data-activate-frac` = "0.75",
            div()
          )
        ), # end .story-column
        
        # RIGHT FIXED STICKY PANE (Pane 2)
        div(
          class = "sticky-pane",
          `data-pane` = "2",
          div(class = "scene-frame", uiOutput(ns("scene2")))
        )
      ) 
    )   
  )
}

mod_storymap2_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    current_step <- reactiveVal("image")
    
    observeEvent(input$current_step, ignoreInit = TRUE, {
      current_step(input$current_step)
    })
    
    output$scene2 <- renderUI({
      # When off-ramp is active, return NULL so pane content is empty
      if (identical(current_step(), "mod_storymap2.R_off")) return(NULL)
      
      switch(current_step(),
             "image" = tags$div(
               style = "margin-top: 10vh;",   # lift the image up a bit
               tags$img(
                 src = "assets/images/PBs.jpg",
                 alt = "Planetary Boundaries",
                 style = "max-width:100%; max-height:60vh;"
               )
             ),
             "halloween" = tags$div(
               h1("other addition"),
               p("Maybe a halloween pumpkin")
             ),
             NULL
      )
    })
  })
}
