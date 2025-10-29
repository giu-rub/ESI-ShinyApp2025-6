# ---- footer_module.R ----

mod_footer_ui <- function(id) {
  ns <- NS(id)
  
  tags$section(
    id = ns("footer-section"),
    role = "contentinfo",
    class = "footer-section",
    
    # ---- Left side ----
    tags$div(
      class = "footer-left",
      tags$div(
        class = "widget",
        tags$h5(class = "widget-title font-alt mb-1", "Site developed by"),
        tags$p(
          "Giorgio Parlato (Stockholm Resilience Center) and Giulia I. Rubin (Global Economic Dynamics and the Biosphere).",
          style = "margin-bottom: 10px;"
        ),
        tags$p(
          tags$a(
            href = "https://www.linkedin.com/company/stockholm-resilience-centre/posts/?feedView=all",
            target = "_blank", rel = "noopener",
            tags$i(class = "fa fa-linkedin fa-2x custom-icon")
          ),
          HTML("&nbsp;&nbsp;"),
          tags$a(
            href = "https://github.com/giorgioparlato/ESI_tool_live/tree/main",
            target = "_blank", rel = "noopener",
            tags$i(class = "fa fa-github fa-2x custom-icon")
          ),
          HTML("&nbsp;&nbsp;"),
          tags$a(
            href = "https://www.instagram.com/sthlmresilience/",
            target = "_blank", rel = "noopener",
            tags$i(class = "fa fa-instagram fa-2x custom-icon")
          )
        )
      )
    ),
    
    # ---- Right side (image) ----
    tags$div(
      class = "footer-right",
      tags$img(
        src = "assets/images/ESI_logo_family.png",
        alt = "ESI Logo",
        class = "footer-image"
      )
    )
  )
}

mod_footer_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # no server-side logic for now
    invisible(NULL)
  })
}
