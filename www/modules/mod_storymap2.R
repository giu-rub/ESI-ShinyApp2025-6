mod_storymap2_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    tags$head(
      tags$link(rel = "stylesheet", href = "esi.css"),
      tags$script(src = "assets/js/scroll-observer.js")
    ),
    
    # Root wrapper carries the module namespace for the JS
    div(
      class = "storymap-root",
      id = ns("root"),
      `data-ns` = ns(""),
      
      div(
        class = "storymap-wrap",
        
        # LEFT COLUMN
        div(
          class = "story-column",
          
          div(class = "story-step", `data-step` = "intro",
              div(
                h2("Welcome!"),
                p("Welcome! The Global Economic Dynamics and the Biosphere programme (GEDB) invites you to explore the Earth System Impact (ESI) — a science-based tool launched in 2023 that shows how corporate and investment activities influence the planet’s interconnected systems of climate, land, and water.")
              )
          ),
          
          div(class = "story-step", `data-step` = "interactions",
              div(
                h2("Some science to keep in mind"),
                p("Here you can learn how the three systems interact on the planet.")
              )
          ),
          
          div(class = "story-step", `data-step` = "image",
              div(
                h2("Planetary Boundaries"),
                p("Here you understand what the planetary consequences of not doing this are.")
              )
          ),
          
          div(class = "story-step", `data-step` = "closing",
              div(
                h2("Hook to EU regulation"),
                p("Laws are changing, and so should your business accounting!")
              )
          ),
          
        ), 
        
        # RIGHT STICKY PANE
        div(
          class = "sticky-pane",
          div(class = "scene-frame",
              uiOutput(ns("scene"))
          )
        )
      ) # closes storymap-wrap
    ) # closes storymap-root
  )
}

mod_storymap2_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    # Track current step (updated by JS via Shiny.setInputValue)
    current_step <- reactiveVal("intro")
    observeEvent(input$current_step, ignoreInit = TRUE, {
      current_step(input$current_step)
    })
    
    # RIGHT PANE LOGIC
    output$scene <- renderUI({
      if (is.null(step)) step <- "intro" 
      step <- current_step()
      switch(step,
             
             "intro" = tags$div(
               h1("Intro scene"),
               p("Maybe a map with 2D globe and pictures of who is working on this — some connections across the globe and little pop-ups.")
             ),
             
             "interactions" = tags$div(
               tags$img(
                 src = "assets/images/ESI_interactions_5.png",
                 alt = "ESI interactions",
                 style = "max-width:100%; max-height:80vh;"
               )
             ),
             
             "image" = tags$div(
               tags$img(
                 src = "assets/images/PBs.jpg",
                 alt = "Planetary Boundaries",
                 style = "max-width:100%; max-height:80vh;"
               )
             ),
             
             "closing" = tags$div(
               h2("What can you do?"),
               p("Assess your company's impact on the planet. Start from using the ESI tool.")
             ),
             
             # Fallback
             tags$div(h2("Scene not found"))
      )
    })
    
    # Example chart (unused for now)
    output$demo_plot <- renderPlot({
      req(current_step() == "chart")
      plot(cars, main = "Demo chart (cars)", xlab = "speed", ylab = "dist")
    })
  })
}
