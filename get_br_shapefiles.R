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
dir_immediate_region <- "metropolitan_region"
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

# save shapefiles ---------------------------------------------------------

# create subdirectories
dir_path <- file.path(dir_output,dir_immediate_region)
if(!dir.exists(dir_path)) dir.create(dir_path)
dir_path <- file.path(dir_output,dir_municip)
if(!dir.exists(dir_path)) dir.create(dir_path)

# Metropolitan Region of Sao Paulo
dir_path <- file.path(dir_output,dir_immediate_region,"RMSP")
if(!dir.exists(dir_path)) dir.create(dir_path)
st_write(rmsp, file.path(dir_path,"RMSP.shp"))

# Metropolitan Region of Sao Paulo (simplified)
dir_path <- file.path(dir_output,dir_immediate_region,"RMSP_s")
if(!dir.exists(dir_path)) dir.create(dir_path)
st_write(rmsp_s, file.path(dir_path,"RMSP_s.shp"))

# municipalities from the Metropolitan Region of Sao Paulo
dir_path <- file.path(dir_output,dir_municip,"RMSP_municip")
if(!dir.exists(dir_path)) dir.create(dir_path)
st_write(rmsp_municip, file.path(dir_path,"RMSP_municip.shp"))

# municipalities from the Metropolitan Region of Sao Paulo (simplified)
dir_path <- file.path(dir_output,dir_municip,"RMSP_municip_s")
if(!dir.exists(dir_path)) dir.create(dir_path)
st_write(rmsp_municip_s, file.path(dir_path,"RMSP_municip_s.shp"))

# ---------------------------------------------------------------------------- #