mod_disclaimer_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      class = "esi-disclaimer",
      p(
        "This webpage presents the ",
        strong("prototype"),
        " Earth System Impact (ESI) score — a science-based tool for assessing the planetary impacts of assets across climate, land, and water systems."
      ),
      tags$ul(
        tags$li(
          strong("Systemic:"), " captures interactions between CO₂, water, and land"
        ),
        tags$li(
          strong("Context-sensitive:"), " accounts for regional and ecosystem differences"
        ),
        tags$li(
          strong("Science-based:"), " evaluates impacts relative to planetary guardrails"
        )
      ),
      p(
        "For more details, see ",
        tags$a(
          href = "https://iopscience.iop.org/article/10.1088/1748-9326/ac2db1",
          target = "_blank",
          em("Lade et al. (2021)")
        ),
        " and ",
        tags$a(
          href = "https://www-sciencedirect-com.ezp.sub.su.se/science/article/pii/S0959652623036818?via%3Dihub",
          target = "_blank",
          em("Crona et al. (2023)")
        ),
        "."
      ),
      div(class="my-4 text-center", img(src = "ESi_interactions_5.png", style = "width: 50%; height: auto;")),
    )
  )
}

mod_disclaimer_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # logic required to then make it non-static
  })
}
