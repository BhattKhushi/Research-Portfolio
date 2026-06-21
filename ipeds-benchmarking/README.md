# IPEDS Institutional Benchmarking Analysis

## Overview
This project analyzes how the University at Albany, SUNY compares to its peer 
institutions across four key student outcome metrics: 4-year graduation rate, 
6-year graduation rate, total undergraduate enrollment, and percentage of students 
receiving grant aid. Data was drawn from the IPEDS 2023-24 survey cycle, and the 
peer set was sourced directly from UAlbany's own official IPEDS Data Feedback Report 
comparison group, the same benchmark the university uses internally.

## Research Question
How does the University at Albany perform relative to its peer institutions on 
enrollment, graduation outcomes, and financial aid coverage, and what patterns 
emerge that warrant further investigation?

## Peer Institution Set
The 11-institution peer set was drawn from UAlbany's official 2024 IPEDS Data 
Feedback Report, reflecting the comparison group UAlbany itself selected for 
institutional benchmarking purposes. Institutions included: University at Albany 
(anchor), Binghamton University, Stony Brook University, University at Buffalo, 
University of Connecticut, University of Vermont, Old Dominion University, Northern 
Illinois University, University of Wisconsin-Milwaukee, University of Oregon, and 
University of Colorado Boulder.

## Tools
- R / RStudio: data cleaning, analysis, and visualization
- IPEDS Data Center: primary data source
- Tableau Public: interactive dashboard

## Methods
Four IPEDS survey files were downloaded for the 2023-24 collection cycle: 
Institutional Characteristics (HD), Fall Enrollment (EF), Graduation Rates (GR), 
and Student Financial Aid (SFA). Each file was filtered to the 11-institution peer 
set in R using tidyverse. Graduation rates were calculated by dividing the number 
of completers by the adjusted cohort size, using grtype 3 over grtype 2 for 6-year 
rates, and grtype 4 over grtype 2 for 4-year rates. All metrics were joined into a 
single peer comparison table, exported to Excel, and visualized using ggplot2 in R 
and Tableau Public.

## Key Findings
UAlbany ranks 8th out of 11 peer institutions on 6-year graduation rate at 61.4%, 
trailing the peer median by 12.8 percentage points. Interestingly, the picture looks 
quite different when examining 4-year completion, UAlbany ranks 1st out of the 8 
institutions that reported this metric, with 27.1% of students graduating on time. 
This gap between 4-year and 6-year outcomes suggests that students who fall behind 
the traditional timeline at UAlbany may be less likely to eventually complete, which 
is a pattern worth examining more closely.

On financial aid, UAlbany ranks 3rd highest in the peer set with 85% of 
undergraduates receiving grant aid, signaling that the institution serves a 
relatively high-need student population. The combination of strong financial aid 
coverage and a below-median 6-year graduation rate raises questions about whether 
financial barriers — such as stopout or reduced course loads, may be contributing 
to delayed or incomplete degree progression. UConn (83.3%) and Binghamton (81.6%) 
represent the top performers in the peer set and serve as aspirational benchmarks 
for UAlbany's graduation outcomes.

## Limitations and Future Directions
This analysis is descriptive in nature and does not establish causal relationships 
between any of the variables examined. Retention rate data was unavailable for the 
2023-24 IPEDS cycle, which would have added an important dimension to the student 
outcomes picture. The higher 4-year graduation rate at UAlbany relative to other 
SUNY peers likely reflects differences in program mix, UAlbany's concentration in 
social sciences, public policy, and criminal justice tends to produce more on-time 
completers than the engineering and STEM-heavy programs at Stony Brook and Buffalo, 
rather than a structural advantage in student support.

Future iterations of this analysis could incorporate first-generation student 
population data, Pell grant recipient percentages, and institutional spending per 
student to better explain the outcome gaps observed across the peer set. A 
regression model controlling for student demographics would allow for a more 
rigorous comparison that accounts for differences in the populations each 
institution serves.

## Dashboard
[View the interactive Tableau dashboard here](https://public.tableau.com/app/profile/khushi.samira.bhatt/viz/IPEDSPeerBenchmarking/IPEDSPeerBenchmarking-UniversityatAlbany2023-24)

## Data Source
U.S. Department of Education, IPEDS Data Center, 2023-24.
Publicly available at https://nces.ed.gov/ipeds/
