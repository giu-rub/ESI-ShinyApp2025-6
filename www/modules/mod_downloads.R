mod_downloads_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    singleton(tags$head(
      tags$link(rel = "stylesheet", href = "esi.css")
    )),
    
    div(
      class = "downloads-section",
      h2("RESOURCES"),
      
      div(
        class = "download-grid",
        
        # 1) Excel tool (download)
        tags$a(
          class = "resource-card",
          href = "ESI_prototype_tool.v1.1/ESI_prototype_tool.v1.1.xlsx",
          download = "ESI_prototype_tool.v1.1.xlsx",
          `aria-label` = "Download Offline Excel Tool",
          
          tags$div(
            class = "resource-card__text",
            tags$h4(class = "resource-card__title", "Offline Excel Tool"),
            tags$p(class = "resource-card__desc", "Download the prototype tool as an Excel workbook for offline use."),
            tags$span(class = "resource-card__tag", "Excel")
          ),
          
          tags$div(class = "resource-card__icon", tags$span("↗"))
        ),
        
        # 2) Manual (open in new tab)
        tags$a(
          class = "resource-card",
          href = "ESI_tool_manual.pdf",
          target = "_blank", rel = "noopener noreferrer",
          `aria-label` = "Open User Manual",
          
          tags$div(
            class = "resource-card__text",
            tags$h4(class = "resource-card__title", "User Manual (PDF)"),
            tags$p(class = "resource-card__desc", "Open the guide explaining inputs, methodology, and how to interpret outputs."),
            tags$span(class = "resource-card__tag", "PDF")
          ),
          
          tags$div(class = "resource-card__icon", tags$span("↗"))
        ),
        
        # 3) Paper (open in new tab)
        tags$a(
          class = "resource-card",
          href = "https://www-sciencedirect-com.ezp.sub.su.se/science/article/pii/S0959652623036818",
          target = "_blank", rel = "noopener noreferrer",
          `aria-label` = "Open Publication",
          
          tags$div(
            class = "resource-card__text",
            tags$h4(class = "resource-card__title", "Academic Publication"),
            tags$p(class = "resource-card__desc", "Read the peer-reviewed paper describing the ESI metric and its foundations."),
            tags$span(class = "resource-card__tag", "Publication")
          ),
          
          tags$div(class = "resource-card__icon", tags$span("↗"))
        )
        
      )
    )
  )
}

mod_downloads_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}