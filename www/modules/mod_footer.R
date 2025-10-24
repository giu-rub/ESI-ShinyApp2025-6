mod_footer_ui <- function(id) {
  ns <- NS(id)
  tags$section(
    class = "module-small custom-padding",
    style = "background-color: #fff; color: #333;",  # white background + readable text
    tags$div(
      class = "container",
      tags$div(
        class = "row",
        tags$div(
          class = "col-sm-12",
          tags$div(
            class = "widget",
            tags$div(class = "spacer"),
            tags$h5(class = "widget-title font-alt", "Site developed by"),
            tags$p(
              "Giorgio Parlato (Stockholm Resilience Center) and Giulia I. Rubin (Global Economic Dynamics and the Biosphere)."
            ),
            tags$p(
              # LinkedIn
              tags$a(
                href = "https://www.linkedin.com/company/stockholm-resilience-centre/posts/?feedView=all",
                target = "_blank", rel = "noopener",
                tags$i(class = "fa fa-linkedin custom-icon")
              ),
              HTML("&nbsp;&nbsp;"),
              # GitHub
              tags$a(
                href = "https://github.com/giorgioparlato/ESI_tool_live/tree/main",
                target = "_blank", rel = "noopener",
                tags$i(class = "fa fa-github custom-icon custom-icon-github")
              ),
              HTML("&nbsp;&nbsp;"),
              # Instagram
              tags$a(
                href = "https://www.instagram.com/sthlmresilience/",
                target = "_blank", rel = "noopener",
                tags$i(class = "fa fa-instagram custom-icon")
              ),
              HTML("&nbsp;&nbsp;"),
              # Email
              tags$a(
                href = "mailto:giorgio.parlato@su.se?subject=ESI%20Tool%20Inquiry",
                title = "Email Giorgio Parlato",
                tags$i(class = "fa fa-envelope custom-icon")
              )
            )
          )
        )
      )
    )
  )
}

mod_footer_server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}
