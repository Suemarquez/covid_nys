# Scrape count data 

library(tidyverse)
library(stringr)
library(rvest)

url <- read_html("https://coronavirus.health.ny.gov/county-county-breakdown-positive-cases")

covid_count_table <- html_nodes(url, "table") %>%
  .[[1]] %>%
  html_table() %>%
 # rename("County" = "") %>%
  filter(!grepl("Outside|Statewide", County)) %>%
  mutate(County = gsub(" County.*", "", County)) %>%
  mutate(County = str_replace_all(County, "[[:punct:]]", "")) %>%
  mutate(Date = Sys.Date())

path_countdata <- paste0("data/covid_count_daily/covid_nys_", gsub("-", "", Sys.Date()), ".csv")

write_csv(covid_count_table, path = path_countdata)

