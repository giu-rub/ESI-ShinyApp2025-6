mod_storymap2_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    tags$head(
      tags$link(rel = "stylesheet", href = "esi.css")
    ),
    
    div(
      class = "storymap2-static",
      style = "
        width: 100%;
        padding: clamp(40px, 6vw, 100px) 16px;
        display: flex;
        justify-content: center;
      ",
      
      div(
        style = "
          width: 100%;
          max-width: 900px;
          text-align: center;
          display: flex;
          flex-direction: column;
          gap: 70px;
          color: #FFF8F1;
        ",
        
        # -------- BLOCK 1: Planetary Boundaries --------
        div(
          style = "
            display: flex;
            flex-direction: column;
            gap: 32px;
          ",
          
          div(
            style = "
              text-align: justify;
              text-justify: inter-word;
              hyphens: auto;
            ",
            h2("ESI and a 'safe operating space'", style = "text-align: center; margin: 0 0 1.25rem 0;"),
            p("The Planetary Boundary framework defines a scientific safe operating space for humanity by setting limits on nine critical Earth-system processes.
Transgressing these limits increases the risk of triggering non-linear and potentially irreversible environmental change. This, in turn, risks affecting the Earth’s capacity to maintain stable conditions for human society to prosper and develop.
The ESI captures impacts in relation to three Planetary Boundaries: climate change, land-system change, and freshwater change (blue water). This allows companies and investors to assess the planetary-scale impact of local economic activities across these three key dimensions.
"),
),
          
          tags$img(
            src = "assets/images/PBs.png",
            alt = "Planetary Boundaries",
            style = "
              width: 100%;
              max-width: 700px;
              height: auto;
              margin: 0 auto;
              display: block;
            "
          )
        ),
        
        # -------- BLOCK 2: Interactions --------
        div(
          style = "
            display: flex;
            flex-direction: column;
            gap: 32px;
          ",
          
          div(
            style = "
              text-align: justify;
              text-justify: inter-word;
              hyphens: auto;
            ",
            h2("Accounting for Earth System Interactions", style = "text-align: center; margin: 0 0 1.25rem 0;"),
            p("Many planetary boundaries are interconnected and impacts on one can often affect others.

For example, atmospheric CO2 concentrations and a changing climate influence temperature, which in turn affects water cycles, rainfall patterns and vegetation growth globally. 
Land degradation on the other hand, affects the climate through vegetation that releases or stores carbon, and by altering the capacity of the soil to absorb and retain water
The ESI accounts for four key interactions between climate, vegetation and fresh water.
"),
          ),
          
          tags$img(
            src = "assets/images/interactions.png",
            alt = "Climate, land and water interactions",
            style = "
              width: 100%;
              max-width: 700px;
              height: auto;
              margin: 0 auto;
              display: block;
            "
          )
        )
      )
    )
  )
}

mod_storymap2_server <- function(id) {
  moduleServer(id, function(input, output, session) {
  })
}