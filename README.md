# covid_nys

This repository contains R scripts that:
1. Scrape COVID-19 official count from the [New York State Department of Health COVID-19 page](https://coronavirus.health.ny.gov/county-county-breakdown-positive-cases).  
2. Matches the county name to the most recent [NY state coastline shapefile](http://gis.ny.gov/gisdata/inventories/details.cfm?DSID=927).
3. Summarizes the data in a shiny dashboard hosted [here](https://smarquez.shinyapps.io/covid_nys_dashboard/).
4. Scrape cases, hospitalization and deaths data from [New York City Health Department](https://www1.nyc.gov/site/doh/covid/covid-19-main.page). Unfortunately this information is made available daily on pdfs files. Yes, you read right, in pdf files! So in this case there is some brute force you can find in the `scrape_nyc_tables.Rmd` file. 

## Structure of the data files

The start date for this count data is March 09, 2020 and is updated daily at 9pm EST. The structure of the files are as follow:

```bash
data/
├── NYS_Civil_Boundaries_SHP
│   ├── Counties_Shoreline.cpg
│   ├── Counties_Shoreline.dbf
│   ├── Counties_Shoreline.prj
│   ├── Counties_Shoreline.sbn
│   ├── Counties_Shoreline.sbx
│   ├── Counties_Shoreline.shp
│   ├── Counties_Shoreline.shp.xml
│   └── Counties_Shoreline.shx
├── covid_count_daily
│   ├── covid_nys_<YYYYMMDD>.csv
├── covid_count_map
│   ├── covid_count.dbf
│   ├── covid_count.prj
│   ├── covid_count.shp
│   └── covid_count.shx
├── covid_nyc_daily
│   ├── all_cases_hosp_deaths.csv
│   ├── cases_<YYYYMMDD>.csv
│   ├── deaths_<YYYYMMDD>.csv
│   ├── hosp_<YYYYMMDD>.csv
└── covid_time_series
    └── covid_time_series.csv
```

If you only need the time series for the state of New York, go straight and fetch the file `covid_time_series.csv`.

For data specifically on New York City, the data was made available at the borough level much later than the state data. You can find the series under the file `all_cases_hosp_deaths`.

Publicly available data on daily number of tests is not available.
