mod_downloads_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h3("Downloads"),
    h5("On this page you can download the prototype tool in Excel format, and the accompanying user manual"),
    p("The ESI Excel tool allows companies and investors to test the ESI metric..."),
    p(
      strong("Please note that the ESI metric is currently a prototype."),
      " We advise caution when interpreting its results..."
    ),
    p(
      "You can download the zip folder containing both the Excel tool and ",
      a("the user manual",
        href = "ESI_tool_manual.pdf",
        target = "_blank",
        rel = "noopener"
      ),
      " by clicking on the button below."
    ),
    div(
      class = "download-card text-center",
      tags$a(
        class = "btn btn-primary w-100",
        href = "ESI_prototype_tool.v1.1.zip",
        download = "ESI_prototype_tool.v1.1.zip",
        role = "button",
        "Download Excel Tool (zip folder)"
      )
    ),
    p(
      class = "disclaimer mt-4",
      strong("DISCLAIMER: "),
      "This tool is still in first iteration..."
    ),
    div(
      class = "my-4 text-center",
      img(src = "ESI_manual_pic.png",
          class = "download-preview",
          alt = "ESI Excel tool and manual preview")
    )
  )
}

mod_downloads_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}
