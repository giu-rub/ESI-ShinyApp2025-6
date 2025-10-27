# R/mod_storymap.R
mod_storymap_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    # Load your global CSS + this module's scroll observer JS
    tags$head(
      tags$link(rel = "stylesheet", href = "esi.css"),
      tags$script(src = "assets/js/scroll-observer.js")
    ),
    
    # Root wrapper carries the module namespace for the JS
    div(
      class = "storymap-root",
      id = ns("root"),
      `data-ns` = ns(""),
      
      # Two-column scrollytelling layout
      div(class = "storymap-wrap",
          
          # LEFT: scrollable narrative (each .story-step needs a unique data-step)
          div(class = "story-column",
              div(class = "story-step", `data-step` = "intro",
                  div(
                    h2("Welcome"),
                    p("Scroll this left column. The right pane updates with the active step.")
                  )
              ),
              div(class = "story-step", `data-step` = "chart",
                  div(
                    h2("Chart scene"),
                    p("When this step is most visible, we render a basic chart.")
                  )
              ),
              div(class = "story-step", `data-step` = "image",
                  div(
                    h2("Image scene"),
                    p("This step swaps in an image on the right.")
                  )
              ),
              div(class = "story-step", `data-step` = "closing",
                  div(
                    h2("Closing"),
                    p("Replace these scenes with your real modules and widgets.")
                  )
              )
          ),
          
          # RIGHT: sticky scene pane
          div(class = "sticky-pane",
              div(class = "scene-frame",
                  uiOutput(ns("scene"))
              )
          )
      )
    )
  )
}

mod_storymap_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    # Track current step (updated by JS via Shiny.setInputValue(ns('current_step'), ...))
    current_step <- reactiveVal("intro")
    observeEvent(input$current_step, ignoreInit = TRUE, {
      current_step(input$current_step)
    })
    
    # Switch the right-side scene based on current step
    output$scene <- renderUI({
      step <- current_step()
      switch(step,
             "intro" = tags$div(
               h1("Intro scene"),
               p("Right pane is sticky. It changes as you scroll the left column.")
             ),
             "chart" = tags$div(
               plotOutput(session$ns("demo_plot"), height = "80vh")
             ),
             "image" = tags$div(
               # replace with your own asset in /www
               tags$img(
                 src = "https://placekitten.com/1000/600",
                 alt = "Example image",
                 style = "max-width:100%; max-height:80vh;"
               )
             ),
             "closing" = tags$div(
               h2("All done!"),
               p("Hook up your leaflet/ggplot modules here.")
             ),
             # fallback
             tags$div(h2("Scene not found"))
      )
    })
    
    # Example chart for the "chart" scene
    output$demo_plot <- renderPlot({
      req(current_step() == "chart")
      plot(cars, main = "Demo chart (cars)", xlab = "speed", ylab = "dist")
    })
  })
}
