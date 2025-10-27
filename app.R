library(shiny)
library(tidyverse)
library(DT)
library(formattable)
library(bslib)
library(leaflet)
library(terra)
library(tidyterra)
library(ncdf4)
library(readr)
library(tibble)

options(shiny.resource.cache = FALSE)

# ---- SHOWCASE ----
# initial table
initial_data <- tryCatch(
  read_csv("data/esi_tool_sample(10^6).csv", show_col_types = FALSE),
  error = function(e) data.frame()
)

# Land coefficients
land_df <- read_csv("data/Land_ESI_coefficients_not_rounded.csv", show_col_types = FALSE)
Land_ESI_matrix <- land_df |>
  column_to_rownames(var = colnames(land_df)[1]) |>
  as.matrix()

# Water coefficients
water_df <- read_csv("data/Water_ESI_coefficients.csv", show_col_types = FALSE)
Water_ESI_matrix <- water_df |>
  column_to_rownames(var = colnames(water_df)[1]) |>
  as.matrix()

# ---- MODULES ----
source("www/modules/mod_intro.R")
source("www/modules/mod_map.R")
source("www/modules/mod_downloads.R")
source("www/modules/mod_showcase.R")
source("www/modules/mod_welcome.R")
source("www/modules/mod_disclaimer.R")
source("www/modules/mod_footer.R")
source("www/modules/mod_storymap.R")
source("www/modules/mod_transition1.R")

# ---- THEME ----
theme <- bs_theme(
  bootswatch = "united",
  font = font_google("Lato"),
  primary = "#E68059"
)


# ---- RASTER FOR MAP MODULE (robust loader) ----
load_map_raster <- function(path = "data/df_esi_inner(withc_esi).csv") {
  if (!file.exists(path)) {
    warning("Raster CSV not found at: ", path, 
            "\nUsing a dummy raster so the app can run. Fix the path to use real data.")
    # Fallback dummy: global 1x1-degree grid with zeros
    rr <- terra::rast(ncols = 360, nrows = 180, 
                      ext = terra::ext(-180, 180, -90, 90), 
                      crs = "EPSG:4326")
    r_stack <- c(rr, rr, rr)
    names(r_stack) <- c("l_esi", "w_esi", "c_esi")
    values(r_stack) <- 0
    return(r_stack)
  }
  
  # Try reading the CSV
  df <- readr::read_csv(path, show_col_types = FALSE)
  
  # Helper: try xyz (lon/lat + values) if columns look like coordinates
  nm <- names(df)
  lon_candidates <- intersect(nm, c("x","lon","longitude","Lon","LONGITUDE"))
  lat_candidates <- intersect(nm, c("y","lat","latitude","Lat","LATITUDE"))
  
  # First attempt: if we have lon/lat and ESI columns, build via xyz
  if (length(lon_candidates) >= 1 && length(lat_candidates) >= 1 &&
      all(c("l_esi","w_esi","c_esi") %in% nm)) {
    lon_col <- lon_candidates[1]
    lat_col <- lat_candidates[1]
    xyz_df <- df[, c(lon_col, lat_col, "l_esi", "w_esi", "c_esi")]
    r_xyz <- try(terra::rast(xyz_df, type = "xyz", crs = "EPSG:4326"), silent = TRUE)
    if (!inherits(r_xyz, "try-error")) {
      names(r_xyz) <- c("l_esi","w_esi","c_esi")
      return(r_xyz)
    }
  }
  
  # Second attempt: let terra guess from a rectangular matrix-like CSV
  r_guess <- try(terra::rast(df, crs = "EPSG:4326"), silent = TRUE)
  if (!inherits(r_guess, "try-error") && all(c("l_esi","w_esi","c_esi") %in% names(r_guess))) {
    return(r_guess)
  }
  
  # If we get here, the CSV isn’t in a raster-friendly format
  warning("Could not coerce CSV to SpatRaster. Using a dummy raster so the app can run.\n",
          "Ensure your CSV either has lon/lat columns plus l_esi,w_esi,c_esi,\n",
          "or load a real raster file (e.g., TIFF/NetCDF/ASC) instead.")
  rr <- terra::rast(ncols = 360, nrows = 180, 
                    ext = terra::ext(-180, 180, -90, 90), 
                    crs = "EPSG:4326")
  r_stack <- c(rr, rr, rr)
  names(r_stack) <- c("l_esi", "w_esi", "c_esi")
  values(r_stack) <- 0
  r_stack
}

# Build 'r' at global scope so the module can see it
r <- load_map_raster("data/df_esi_inner(withc_esi).csv")


ui <- htmlTemplate(
  filename = "www/layout.html",
  page_title = "ESI prototype tool",
  head_deps = tagList(bslib::bs_theme_dependencies(theme)),
  intro_ui       = mod_intro_ui("intro"),
  showcase_ui    = mod_showcase_ui("showcase"),
  downloads_ui   = mod_downloads_ui("downloads"),
  map_ui         = mod_map_ui("map"),
  welcome_ui     = mod_welcome_ui("welcome"),
  disclaimer_ui  = mod_disclaimer_ui("disclaimer"),
  footer_ui  = mod_footer_ui("footer"),
  storymap_ui  = mod_storymap_ui("storymap"),
  transition1_ui  = mod_transition1_ui("storymap")
  )

server <- function(input, output, session) {
  mod_intro_server("intro")
  mod_showcase_server("showcase")
  mod_downloads_server("downloads")
  mod_map_server("map", r = r)
  mod_welcome_server("welcome")
  mod_disclaimer_server("disclaimer")
  mod_footer_server("footer")
  mod_storymap_server("storymap")
  mod_transition1_server("transition1")
}

shinyApp(ui, server)
