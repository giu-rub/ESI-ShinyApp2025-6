mod_welcome_ui <- function(id) {
  ns <- NS(id)
  tagList(
    p("Welcome! The Global Economic Dynamics and the Biosphere programme (GEDB) invites you to explore the Earth System Impact (ESI) — a science-based tool launched in 2023 that shows how corporate and investment activities influence the planet’s interconnected systems of climate, land, and water."),
    
    p("Developed by Beatrice Crona (Stockholm Resilience Centre & Royal Swedish Academy of Sciences), Giorgio Parlato (Royal Swedish Academy of Sciences), Steve Lade (Stockholm Resilience Centre & Australian National University), Ingo Fetzer (Stockholm Resilience Centre), and Victor Maus (Vienna University of Economics and Business), the ESI provides a holistic and interactive way to understand how human actions influence key planetary boundaries, and how these forces interact within the Earth System.The ESI score offers a science-based, location-sensitive framework to help investors and companies align financial decisions with the stability of our planet. This initiative marks a major step toward reshaping how we measure and manage systemic environmental risks, and invites users to explore how collective financial action can sustain the resilience of the biosphere on which all economies depend.")
  )
}

mod_welcome_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}
