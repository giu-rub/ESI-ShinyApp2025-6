mod_downloads_ui <- function(id) {
  ns <- NS(id)
  tagList(
    # Link the external stylesheet
    singleton(tags$head(
      tags$link(rel = "stylesheet", href = "esi.css")
    )),

    div(
      class = "downloads-section",
      
    h3("Downloads"),
    p("Whether you are an investor or a company, you can download the ESI tool and test it offline. Click a card below to download or open the manual."),
    
    # Cards row
    div(
      class = "download-grid",
      
      # Excel tool cover card (downloads the file)
      tags$a(
        class = "download-card",
        href = "ESI_prototype_tool.v1.1/ESI_prototype_tool.v1.1.xlsx",
        download = "ESI_prototype_tool.v1.1.xlsx",
        `aria-label` = "Download Excel Tool",
        tags$img(src = "assets/images/esi_excel_cover.jpeg", alt = "Cover of the ESI Excel Tool"),
        tags$span(class = "download-ribbon", "Excel"),
        tags$span(class = "download-badge", "Download tool")
      ),
      
      # User manual cover card (opens PDF in new tab)
      tags$a(
        class = "download-card",
        href = "ESI_tool_manual.pdf#zoom=page-width",
        target = "_blank", rel = "noopener",
        `aria-label` = "Open User Manual PDF",
        tags$img(src = "assets/images/esi_manual_cover.jpeg", alt = "Cover of the ESI User Manual"),
        tags$span(class = "download-ribbon", "PDF"),
        tags$span(class = "download-badge", "Open manual")
      )
    )
    )
  )
}

mod_downloads_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}
