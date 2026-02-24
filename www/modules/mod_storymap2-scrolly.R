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
          
          # ON-RAMP to delay Pane 2 turning on (kept, commented)
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
              p("The Planetary Boundaries framework is a useful starting point to better grasp the complexity of how human pressures affect the Earth System."),
              p("The Planetary Boundary framework sets ‘safe’ global limits across 9 key Earth System processes. Beyond these limits, the Earth may not be able 
                to continue to self-regulate, and leave the period of stability of the Holocene, in which human society developed."),
              p("Transgressing one or more planetary boundaries can increase the risk of triggering non-linear, abrupt and potentially irreversible environmental
                change, setting in motion self-reinforcing feedbacks that amplify each other and push the Earth towards increasingly warmer temperatures.")
            )
          ),
          
      
          
          # Pane-2 interactions step trigger (you moved this from Pane 1)
          div(
            class = "story-step",
            `data-step` = "interactions",
            `data-pane` = "2",
            div(
              h2("Climate, land and water: interconnected"),
              p("But these boundaries are not isolated in siloes. They interact with each other and can amplify the effect of human impacts on the Earth System."),
              p("For example, changes in climate and CO2 concentrations:"),
              p("1.  impact the water cycle by affecting rainfall distributions"),
              p("2.  affect vegetation through temperature and rainfall changes"),
              p("Land degradation:"), 
              p("1.  impact the climate, through release of greenhouse gases"),
              p("2.  affects water runoff, through changing soil penetration")
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
        ),          
        
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
      step <- current_step()
      if (is.null(step)) return(NULL)
      if (identical(step, "mod_storymap2.R_off")) return(NULL)
      
      switch(
        step,
        "image" = div(class = "scene-bg scene-bg-pane2-pbs"),
        "interactions" = div(class = "scene-bg scene-bg-pane2-interactions"),
        NULL
      )
    })
    
    
  })
}
