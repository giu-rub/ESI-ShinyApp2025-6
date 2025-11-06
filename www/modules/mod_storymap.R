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
              p("The Stockholm Resilience Center and the Australian National University invite you to explore the Earth System Impact (ESI) tool: 
         a science-based platform launched in 2023 made for investors committed to sustainable finance."),
              p("The ESI metric offers a simple-to-use, integrated tool to measure impacts across different environmental dimensions. 
         It is rooted in geo-specific data, and shows impact on the environment at the global scale.")
            )
          ),
        
        
        
          div(
            class = "story-step",
            `data-step` = "esi_financial",
            `data-pane` = "1",
            `data-activate-frac` = "0.5",
            `data-activate-anchor` = "top",
            div(
              class = "esi-financial",
              h2("Financial Risk in the Earth System"),
              p("Corporations are responsible for a significant portion of impacts on the Earth system, 
       including greenhouse gas emissions, water extraction, land use and other pressures on Nature."),
              p("These increasing pressures contribute to exacerbating climate and nature-related financial risks. 
       Yet, the tools used in business and finance to capture environmental impact are too often reduced to flawed ESG ratings or a single focus on carbon, leaving other important environmental dimensions invisible."),
              p("The ESI is a metric of environmental impact that addresses this gap by going beyond simple measures of carbon dioxide emissions and accounting for more of the complexity of the Earth System.")
            )
          ),
          
          
          
          # The actual trigger for the INTRO scene on the right pane
          div(
            class = "story-step intro-trigger",
            `data-step` = "intro",         
            `data-pane` = "1",             
            `data-activate-frac` = "0.15", # smaller = earlier; tweak 0.35–0.55 to taste
            `data-activate-anchor` = "top",
            `data-activate-offset` = "-30",
            div()                          
          ),
          
          
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
        
        
        "esi_financial" = div(
          class = "esi-financial",
          style = "display: flex; justify-content: center; align-items: center; width: 100%;",
          tags$img(
            src = "assets/images/financial_risk.png",
            alt = "Financial risk and the Earth System",
            style = "
           flex: 1 1 300px;
          max-width: 100%;
           height: auto;
         object-fit: cover;
         border-radius: 0.75rem;
        "
          )
        ),
      
        
        NULL
      )
    })
  })
}
