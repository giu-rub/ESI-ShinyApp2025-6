mod_downloads_ui <- function(id) {
  ns <- NS(id)
  tagList(
    # Link the external stylesheet
    singleton(tags$head(
      tags$link(rel = "stylesheet", href = "esi.css")
    )),

    div(
      class = "downloads-section",
      
    h2("RESOURCES"),
    # p("Click a card below to download the offline version of the ESI tool, to consult the manual and to read academic papers on the ESI metric."),
    
    # Cards row
    div(
      class = "download-grid",
      
      # Excel tool cover card (downloads the file)
      tags$a(
        class = "download-card",
        href = "ESI_prototype_tool.v1.1/ESI_prototype_tool.v1.1.xlsx",
        download = "ESI_prototype_tool.v1.1.xlsx",
        `aria-label` = "Download Offline Excel Tool",
        tags$img(src = "assets/images/logo + land.png", alt = "Cover of the ESI tool"),
        tags$span(class = "download-ribbon", "Excel Sheet"),
        tags$span(class = "download-badge", "Download Excel Sheet")
      ),
      
      # User manual cover card (opens PDF in new tab)
      tags$a(
        class = "download-card",
        href = "ESI_tool_manual.pdf",
        target = "_blank", rel = "noopener",
        `aria-label` = "Open User Manual",
        tags$img(src = "assets/images/esi_manual_cover.jpeg", alt = "Cover of the ESI User Manual"),
        tags$span(class = "download-ribbon", "PDF"),
        tags$span(class = "download-badge", "Open PDF")
      ),
      
      # Other publications
      tags$a(
        class = "download-card",
        href = "https://www-sciencedirect-com.ezp.sub.su.se/science/article/pii/S0959652623036818",
        target = "_blank", rel = "noopener",
        `aria-label` = "Open Publication",
        tags$img(src = "assets/images/GoingBeyond.png", alt = "Academic Paper"),
        tags$span(class = "download-ribbon", "Publication"),
        tags$span(class = "download-badge", "Open Publication")
      ),
      
    )
    )
  )
}

mod_downloads_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}
