mod_downloads_ui <- function(id) {
  ns <- NS(id)
  tagList(
    # Keep external CSS if you have other styles
    singleton(tags$head(
      tags$link(rel = "stylesheet", href = "styles.css"),
      # Inline CSS for the layout and user manual button
      tags$style(HTML("
        .download-buttons {
          display: flex;
          justify-content: center;
          align-items: center;
          gap: 20px;
          margin-top: 20px;
          flex-wrap: wrap;
        }
        .manual-button {
          display: inline-block;
          padding: 10px 16px;
          background-color: #0d6efd;
          color: #fff !important;
          font-weight: 600;
          border: none;
          border-radius: 8px;
          text-decoration: none;
          transition: background-color 0.3s ease;
        }
        .manual-button:hover, .manual-button:focus {
          background-color: #0b5ed7;
          text-decoration: none;
        }
        .btn-primary.w-100 {
          width: auto !important;
          min-width: 220px;
        }
      "))
    )),
    
    h3("Downloads"),
    p(
      "Whether you are an investor or a company, you can download the ESI tool and test it offline. Press the left button to download the excel sheet or the right one to consult the user manual.",
    ),
    p(
      strong("Please note:"),
      " the ESI metric is currently a prototype - use caution when interpreting the output."
    ),
    
    # --- Buttons side by side ---
    div(
      class = "download-buttons text-center",
      
      # Download Excel button
      tags$a(
        class = "btn btn-primary w-100",
        href = "ESI_prototype_tool.v1.1/ESI_prototype_tool.v1.1.xlsx",
        download = "ESI_prototype_tool.v1.1/ESI_prototype_tool.v1.1.xlsx",
        role = "button",
        "Download Excel Tool (zip folder)"
      ),
      
      # User manual button
      tags$a(
        href = "ESI_tool_manual.pdf#zoom=page-width",
        target = "_blank",
        rel = "noopener",
        class = "manual-button",
        "Open User Manual (PDF)"
      )
    )
  )
}

mod_downloads_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}
