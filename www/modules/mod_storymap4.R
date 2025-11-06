mod_storymap4_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      class = "storymap-root",
      id = ns("root"),
      `data-ns` = ns(""),
      `data-start-scroll` = "200",
      `data-unstart-scroll` = "50",
      
      div(
        class = "storymap-wrap",
        
        # LEFT COLUMN: steps -> Pane 4
        div(
          class = "story-column",
          
          # ON-RAMP: delay Pane 4 activation
          div(
            class = "story-step on-ramp",
            `data-step` = "mod_storymap4.R_on",
            `data-pane` = "off",
            `data-activate-frac` = "0.1",
            div()
          ),
          
          # STEP 1
          div(
            class = "story-step",
            `data-step` = "esi_intro_fourthpane",
            `data-pane` = "4",
            `data-activate-frac` = "0.1",
            `data-activate-anchor` = "top",
            div(
              class = "esi-section-thirdpane",
              h2("What is the added value of the ESI?"),
              p("We first tested the ESI on some of the largest mining companies in the world. One clear result was that using GHG emissions to identify the most harmful assets can lead to misleading results. Indeed, we see that the mines with the largest GHG emissions are not necessarily the most harmful ones from an Earth System perspective."),
              p("Indeed, in this figure we see that some of the most impactful mines in our sample look like average emitters, and their impact is driven primarily by land and/or water use.")
            )
          ),
          
          # STEP 2
          div(
            class = "story-step",
            `data-step` = "esi_interpret",
            `data-pane` = "4",
            `data-activate-frac` = "0.5",
            `data-activate-anchor` = "top",
            div(
              class = "esi-section",
              h2("Engaging with the ESI score"),
              p("The ESI score can be used in different ways, depending on the purpose of use and the type of stakeholder."),
              
            )
          ),
          
          # STEP 3
          div(
            class = "story-step",
            `data-step` = "esi_interpret2",
            `data-pane` = "4",
            `data-activate-frac` = "0.9",
            `data-activate-anchor` = "top",
            div(
              class = "esi-section2",
              h2("Limitations of the ESI"),
              p("While the ESI score could be seen as an improvement to current metrics to assess environmental impact, it is important to emphasize its limitations, and the need to integrate it with other measures."),
              p("1. The ESI is regionally aggregated and focuses on impacts at a planetary scale. It does not replace local environmental impact assessments, since it misses important considerations such as water/air pollution or biodiversity impacts."),
              p("2. The score captures three Earth system components, and four of their interactions. Many other dimensions could be included and work is ongoing to further develop the metric."),
              p("3. The score might underestimate impact in regions close to tipping, since it does not account for the potential effect of tipping points in accelerating environmental change.")
            )
          ),
          
          # OFF-RAMP: clear Pane 4 before next section
          div(
            class = "story-step off-ramp",
            `data-step` = "mod_storymap4.R_off",
            `data-pane` = "off",
            `data-activate-frac` = "0.25",
            div()
          )
        ),
        
        # RIGHT FIXED STICKY PANE (Pane 4)
        div(
          class = "sticky-pane",
          `data-pane` = "4",
          div(
            class = "scene-frame",
            uiOutput(ns("scene4"))
          )
        )
      )
    )
  )
}

mod_storymap4_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    current_step <- reactiveVal(NULL)
    
    observeEvent(input$current_step, ignoreInit = TRUE, {
      current_step(input$current_step)
    })
    
    output$scene4 <- renderUI({
      step <- current_step()
      if (is.null(step) || step == "mod_storymap4.R_off") return(NULL)
      
      switch(
        step,
        
        # Right pane for STEP 1
        "esi_intro_fourthpane" = div(
          class = "esi-section-fourthpane",
          style = "display: flex; justify-content: center; align-items: center; width: 100%;",
          tags$img(
            src = "assets/images/inter3.png",
            alt = "ESI input types",
            style = "width: 95%; height: auto; object-fit: contain; max-height: 70vh;"
          )
        ),
        
   #Right pane for STEP 2
  
      "esi_interpret" = div(
    class = "esi-image-section",
    p("1. Comparing the total impact of different planned projects, assets, companies, or portfolios while identifying the main drivers contributing to the impact of a given asset/company/portfolio."),
    p("2. Estimate the impacts of planned production sites or suppliers for sourcing materials (see map below)."),
    p("3. Augmenting LCA analysis with an Earth System perspective.")
       ),
        
        # Right pane for STEP 3
        "esi_interpret2" = div(
          class = "esi-text-section",
          style = "max-width: 900px; margin: 0 auto; padding: 1rem;",
          p("The current version of the ESI does not explicitly account for measures normally associated with biodiversity impacts (e.g. mean species abundance, or potentially disappeared fraction of species)."),
          p("However, since the ESI captures some of the major well-established drivers of biodiversity loss (i.e. climate change and land use), and the interactions between them, it can be considered a good proxy for companies’ pressures on biodiversity.")
        ),
        
        NULL
      )
    })
  })
}

