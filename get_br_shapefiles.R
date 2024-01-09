# ---------------------------------------------------------------------------- #
# Name         : Get BR Shapefiles
# Description  : 
# Written by   : Rodrigo Lustosa
# Writing date :  9 Jan 2024 11:29 (GMT -03)
# ---------------------------------------------------------------------------- #

# initialization ----------------------------------------------------------

# packages
library(tidyverse)
library(sf)
library(geobr)

# directory and file names
dir_output <- "output"
dir_immediate_region <- "immediate"
dir_municip          <- "municip"

# download shapefiles -----------------------------------------------------

# geobr information
geobr::list_geobr()

# immediate regions
rmsp_s <- read_immediate_region(code_immediate = 350001,)
rmsp   <- read_immediate_region(code_immediate = 350001,simplified = F)

# municipalities from metropolitan areas
rmsp_municip_s <- read_metro_area() %>% 
  filter(name_metro == "RM São Paulo")
rmsp_municip <- read_metro_area(simplified = F) %>% 
  filter(name_metro == "RM São Paulo")

# ---------------------------------------------------------------------------- #