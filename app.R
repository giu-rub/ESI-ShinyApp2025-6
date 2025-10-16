library(shiny)
library(htmltools)
library(bslib)
library(DT)
library(leaflet)

options(shiny.resource.cache = FALSE)


source("www/modules/mod_intro.R")
source("www/modules/mod_map.R")
source("www/modules/mod_downloads.R")
source("www/modules/mod_table.R")
source("www/modules/mod_welcome.R")
source("www/modules/mod_disclaimer.R")

theme <- bs_theme(
  bootswatch = "united",
  font = font_google("Lato"),
  primary = "#E68059"
)

ui <- htmlTemplate(
  filename = "www/layout.html",
  page_title = "ESI prototype tool",
  
  # Inject bslib
  head_deps = tagList(
    bslib::bs_theme_dependencies(theme)
  ),
  
  
  # Module UIs go into placeholders
  intro_ui     = mod_intro_ui("intro"),
  table_ui     = mod_table_ui("table"),
  downloads_ui = mod_downloads_ui("downloads"),
  map_ui       = mod_map_ui("map"),
  welcome_ui   = mod_welcome_ui("welcome"),
  disclaimer_ui   = mod_disclaimer_ui("disclaimer"),
  
)

server <- function(input, output, session) {
  mod_intro_server("intro")
  mod_table_server("table")
  mod_downloads_server("downloads")
  mod_map_server("map")
  mod_welcome_ui("welcome")
  mod_disclaimer_ui("disclaimer")
}

shinyApp(ui, server)
