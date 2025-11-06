mod_storymap3_ui <- function(id) {
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
        
        # LEFT COLUMN: steps -> Pane 3
        div(
          class = "story-column",
          
          # ON-RAMP: delay Pane 3 activation
          div(
            class = "story-step on-ramp",
            `data-step` = "mod_storymap3.R_on",
            `data-pane` = "off",
            `data-activate-frac` = "0.1",
            div()
          ),
          
          # STEP 1: ESI intro
          div(
            class = "story-step",
            `data-step` = "esi_intro_thirdpane",
            `data-pane` = "3",
            `data-activate-frac` = "0.1",
            `data-activate-anchor` = "top",
            div(
              class = "esi-section-thirdpane",
              h2("The Earth System Impact (ESI) metric"),
              p("The Earth System Impact metric represents a step forward in environmental impact metrics, 
                as it captures some of the complexity of the Earth System in the following four ways:"),
              p("1. Capture impacts on multiple Earth processes (i.e. climate, land and water)."),
              p("2. Accounts for the key Earth System interactions, thus considering how impacts on one Earth System component affect others."),
              p("3. Distinguishes impacts on land and water by location, since the global effects of local environmental pressures can vary dramatically depending on where they happen (e.g. deforestation of tropical forests being extremely impactful on the climate)."),
              p("4. Measures impact in relation to regional boundaries, considering how close to transgressing the 'safe operating space' a particular region already is."),
              p("Because of the importance that location plays in the metric, the ESI is normally estimated at the asset-level, meaning for each individual facility."),
              p("Using the ESI only requires four inputs of data."),
              )
          ),
          
          # STEP 2: Interpreting ESI pt1
          div(
            class = "story-step",
            `data-step` = "esi_interpret",
            `data-pane` = "3",
            `data-activate-frac` = "0.5",
            `data-activate-anchor` = "top",
            div(
              class = "esi-section",
              h2("Interpreting the ESI"),
              p("Calculating the ESI score will output four values: one representing the total impact of that asset, and the other three representing the contribution of each impact driver (i.e., carbon emissions, land use, and water use)."),
              p("For example, a facility with a higher Water ESI than Climate ESI means that water use contributes more to the Earth System Impact of that facility than greenhouse gas emissions."),
              p("Breaking down the total ESI score into its individual components allows identification, for each asset, of what is most problematic and needs to be mitigated."),
            )
          ),
          
          # STEP 3: Interpreting ESI. pt2
          div(
            class = "story-step",
            `data-step` = "esi_interpret2",
            `data-pane` = "3",
            `data-activate-frac` = "0.9",
            `data-activate-anchor` = "top",
            div(
              class = "esi-section2",
              p("The ESI score allows decision-makers to compare the (Earth System) impact of different investments. This could be done to decide in which kinds of projects to invest in, or to identify 
                the most harmful investments or assets to prioritize mitigation actions."),
              p("ESI values are scaled so that a score of 1 million means that the activities contribute to shifting one of the variables (climate, water, or land) from their pre-industrial conditions 
                to their planetary boundaries. A larger ESI score means a larger shift towards the boundaries. ESI scores are usually much smaller than 1M, this however does not represent negligible impact."),
            )
          ),
          
          # OFF-RAMP: clear Pane 3 before next section
          div(
            class = "story-step off-ramp",
            `data-step` = "mod_storymap3.R_off",
            `data-pane` = "off",
            `data-activate-frac` = "0.25",
            div()
          )
        ),
        
        # RIGHT FIXED STICKY PANE (Pane 3)
        div(
          class = "sticky-pane",
          `data-pane` = "3",
          div(
            class = "scene-frame",
            div(                       # <-- wrapper added
              class = "esi-video-section",
              uiOutput(ns("scene3"))
            )
          )
        )
      )
    )
  )
}

mod_storymap3_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    current_step <- reactiveVal("esi_intro")
    
    observeEvent(input$current_step, ignoreInit = TRUE, {
      current_step(input$current_step)
    })
    
    output$scene3 <- renderUI({
      step <- current_step()
      if (is.null(step) || step == "mod_storymap3.R_off") return(NULL)
      
      switch(
        step,
        
        # Right pane content for ESI intro: VIDEO
        "esi_intro_thirdpane" = div(
          class = "esi-section-thirdpane",
          style = "display: flex; justify-content: center; align-items: center; width: 100%;",
          tags$video(
            alt = "ESI input types",
            autoplay = TRUE, muted = TRUE, loop = TRUE, playsinline = TRUE,
            style = "width: 95%; height: auto; object-fit: contain; max-height: 70vh;",
            tags$source(src = "assets/images/ESI_data_inputs.mp4", type = "video/mp4"),
          )
        ),
        
        # Right pane content for ESI interpret: IMAGE
        "esi_interpret" = div(
          class = "esi-image-section",
          style = "display: flex; justify-content: center; align-items: center; width: 100%;",
          tags$img(
            src = "assets/images/inter1.png",
            alt = "Interpreting the ESI results pt.1",
            style = "max-width: 95%; height: auto; max-height: 70vh; object-fit: contain; margin-top: 1rem;"
          )
        ),
        
        # Right pane content for ESI interpret2: IMAGE2
        "esi_interpret2" = div(
          class = "esi-image-section2",
          style = "display: flex; justify-content: center; align-items: center; width: 100%;",
          tags$img(
            src = "assets/images/inter2.png",
            alt = "Interpreting the ESI results pt.2",
            style = "max-width: 95%; height: auto; max-height: 70vh; object-fit: contain; margin-top: 1rem;"
          )
        ),
        
        NULL
      )
    })
  })
}
