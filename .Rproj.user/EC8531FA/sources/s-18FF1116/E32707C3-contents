# Match the shapefile data with Covid cases in the same data frame

# ---- Join latest count and map data

library(tidyverse)
library(data.table)
library(sf)
library(janitor)

# Read the most recent cummulative count for the map
latest_file <- fread(paste0("data/covid_count_daily/covid_nys_", gsub("-", "", Sys.Date()), ".csv"))

# Join the most recent count with shapefile 
nys_map <- st_read("data/NYS_Civil_Boundaries_SHP/Counties_Shoreline.shp") %>%
  mutate(NAME_NYC = ifelse(NYC == "Y", "New York City", as.character(NAME))) %>%
  left_join(latest_file, by = c("NAME_NYC" = "County")) %>%
  clean_names() %>%
  select(name, positive_cases, date, name_nyc, geometry)

# Replace the map file with the most recent count
file.remove("data/covid_count_map/covid_count.shp")
st_write(nys_map, "data/covid_count_map/covid_count.shp")

# ---- Join data for timeseries

# Function to rbind all files with counts 
list_files <- paste0("data/covid_count_daily/", list.files(path = "data/covid_count_daily/"))

covid_bind_fx <- function(list_files) {
  tables <- list()
  tables <- lapply(list_files, fread, header = TRUE)
  covid_series <- do.call(rbind, tables)
  return(covid_series)
}

# Replace file to include the latest date
covid_series <- covid_bind_fx(list_files = list_files)
file.remove("data/covid_time_series/covid_time_series.csv")
write_csv(covid_series, "data/covid_time_series/covid_time_series.csv")