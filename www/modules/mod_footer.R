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
      #tags$div(
      #  class = "widget",
       # tags$h5(class = "widget-title font-alt mb-1", "Site developed by"),
        #tags$p(
         # "Giorgio Parlato (Stockholm Resilience Center) and Giulia I. Rubin (Global Economic Dynamics and the Biosphere).",
         # style = "margin-bottom: 10px;"
        #),
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
     # )
    ),
    
   # ---- Middle (contact form) ----
   tags$div(
     class = "footer-middle",
     
     tags$h5("Contact us! (now the destination email is giulia's but esi shoudl create its own and change the email in the code)"),
     
     textInput(
       ns("name"),
       label = NULL,
       placeholder = "Name"
     ),
     
     textInput(
       ns("email"),
       label = NULL,
       placeholder = "Email"
     ),
     
     textAreaInput(
       ns("message"),
       label = NULL,
       placeholder = "Message",
       rows = 3
     ),
     
     actionButton(
       ns("send"),
       "Send",
       class = "btn btn-sm btn-primary"
     )
   ),
   
   
   
    # ---- Right side (image) ----
    tags$div(
      class = "footer-right",
      tags$img(
        src = "assets/images/esi-logo-new1.png",
      alt = "ESI Logo",
        class = "footer-image"
      )
    )
  )
}

mod_footer_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    observeEvent(input$send, {
      req(input$name, input$email, input$message)
      
      email <- blastula::compose_email(
        body = blastula::md(glue::glue("
**New contact form submission**

**Name:** {input$name}  
**Email:** {input$email}  

**Message:**  
{input$message}
"))
      )
      
      blastula::smtp_send(
        email,
        to = "giulia.rubin@su.se",
        from = "giulia.rubin@su.se",
        subject = "New message from footer contact form",
        credentials = blastula::creds_file("~/.smtp_creds_su")
      )
      
      showNotification("Message sent", type = "message")
      
      updateTextInput(session, "name", "")
      updateTextInput(session, "email", "")
      updateTextAreaInput(session, "message", "")
    })
  })
}
