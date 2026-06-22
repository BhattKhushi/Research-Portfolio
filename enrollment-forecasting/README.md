# Enrollment Trends & Forecasting Dashboard

## Overview

Higher education enrollment in the United States has undergone significant shifts over the past decade, shaped by demographic change, economic pressures, and the disruptions of a global pandemic. This project examines those shifts using IPEDS Fall Enrollment data spanning 2014 through 2024, covering all degree-granting institutions reporting to the National Center for Education Statistics. Using R for data cleaning, aggregation, and time-series modeling, and Tableau for visualization, this analysis traces national enrollment trajectories and forecasts where enrollment is headed through 2029. Findings are disaggregated by race/ethnicity and gender to surface patterns that national totals alone would obscure.

## Tools and Methods

Data cleaning, aggregation, and ARIMA time-series forecasting were conducted in R using the tidyverse and forecast packages across eleven years of IPEDS Fall Enrollment survey files. Institutional characteristics were joined from the HD2024 file to support institution-level identification. Visualizations were built in both ggplot2 and Tableau Public.

## Data Sources

IPEDS Fall Enrollment Survey files EF2014A through EF2024A, accessed via the NCES Data Center. Where revised files were available, the revised version was used to ensure data accuracy. Institutional characteristics were drawn from HD2024.

## Key Findings

National undergraduate enrollment peaked at just over 20.9 million students in 2014 and declined steadily through the decade, reaching its lowest point of 19.2 million in 2022. The steepest single-year drop occurred between 2019 and 2020, a period that coincides with the onset of the COVID-19 pandemic and the widespread disruption it caused to enrollment pipelines. Recovery began in 2023 and continued into 2024, when enrollment reached 20.4 million. The ARIMA model projects enrollment to stabilize near that level through 2029, suggesting the post-pandemic rebound may be leveling off rather than continuing to climb.

Disaggregated trends reveal important variation beneath the national story. Hispanic student enrollment grew consistently across the full eleven-year period, making it one of the only demographic groups to show uninterrupted gains. White student enrollment declined throughout, reflecting broader demographic shifts in the college-age population. The gender gap between female and male students persisted across every year in the dataset, with female students outnumbering male students by approximately three million annually.

## Dashboard

[View on Tableau Public](https://public.tableau.com/app/profile/khushi.samira.bhatt/viz/EnrollmentTrendsForecasting/Dashboard1?publish=yes)

## Repository Structure

scripts/01_clean.R: loads and merges eleven years of IPEDS Fall Enrollment files, filters to undergraduate headcount, and joins institution names from HD2024  
scripts/02_analyze.R: aggregates enrollment nationally and by subgroup, fits an ARIMA model, generates forecasts through 2029, and exports Tableau-ready CSVs  
scripts/03_visualize.R: produces ggplot2 charts of national trends, race/ethnicity breakdowns, and gender breakdowns  
outputs/: cleaned datasets and exported chart files  

## Author

Khushi Bhatt | [LinkedIn](https://www.linkedin.com/in/khushi-bhatt)
