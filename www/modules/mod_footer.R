mod_footer_ui <- function(id) {
  ns <- NS(id)
  tags$section(
    id = "footer-section",
    role = "contentinfo",
    style = "
      background-color: #f7f4ef;
      color: #333;
      width: 100%;
      margin: 0;
      padding: 0;
      min-height: 40vh;           /* makes the section fill the viewport */
      display: flex;               /* optional: keeps content aligned nicely */
      align-items: flex-start;     /* icons/text start at the top */
    ",
    tags$div(
      class = "container-lg px-3 px-md-5 py-4 text-start",
      tags$div(
        class = "widget",
        tags$h5(class = "widget-title font-alt mb-1", "Site developed by"),
        tags$p(
          "Giorgio Parlato (Stockholm Resilience Center) and Giulia I. Rubin (Global Economic Dynamics and the Biosphere).",
          style = "margin-bottom: 0.5rem;"
        )
      ),
      tags$div(
        tags$p(
          tags$a(
            href = "https://www.linkedin.com/company/stockholm-resilience-centre/posts/?feedView=all",
            target = "_blank", rel = "noopener",
            tags$i(class = "fa fa-linkedin custom-icon")
          ),
          HTML("&nbsp;&nbsp;"),
          tags$a(
            href = "https://github.com/giorgioparlato/ESI_tool_live/tree/main",
            target = "_blank", rel = "noopener",
            tags$i(class = "fa fa-github custom-icon custom-icon-github")
          ),
          HTML("&nbsp;&nbsp;"),
          tags$a(
            href = "https://www.instagram.com/sthlmresilience/",
            target = "_blank", rel = "noopener",
            tags$i(class = "fa fa-instagram custom-icon")
          )
        )
      )
    )
  )
}

mod_footer_server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}
