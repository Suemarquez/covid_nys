# covid_nys

This repository contains R scripts that: 
1. Scrape COVID-19 official count from the [New York State Department of Health COVID-19 page](https://health.ny.gov/diseases/communicable/coronavirus/).  
2. Matches the county name to the most recent [NY state coastline shapefile](http://gis.ny.gov/gisdata/inventories/details.cfm?DSID=927). 
3. Summarizes the data in a shiny dashboard hosted [here](https://smarquez.shinyapps.io/covid_nys_dashboard/).

## Structure of the data files

The start date for this count data is March 09, 2020 and is updated daily at 9pm EST. The structure of the files are as follow:

```bash
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
└── covid_time_series
    └── covid_time_series.csv
```

If you only need the time series, go straight and fetch the file `covid_time_series.csv`.

Publicly available data on daily number of tests is not available. 


