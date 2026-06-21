# Student Retention Risk Dashboard
### Predicting Institutional Retention Risk Across U.S. Colleges and Universities | IPEDS 2023-24

---

## About This Project

Student retention is one of the most consequential, and persistent challenges facing higher education. But not all institutions struggle equally. This project asks a simple question: can we predict which institutions are most at risk of losing students before they graduate?

Using IPEDS 2023-24 data covering 4,947 U.S. colleges and universities, I built a logistic regression model to identify the institutional characteristics most strongly associated with low full-time student retention rates. The results point to clear, systemic patterns, and raise important questions about equity and resource allocation in higher education.

---

## Research Question

Which institutional characteristics predict low full-time student retention rates among U.S. colleges and universities?

---

## Hypotheses

**H1:** Institutions with higher proportions of Black and Hispanic students will show greater retention risk, reflecting systemic gaps in academic support, financial aid, and institutional resources at the schools that serve them.

**H2:** Institutions with higher student-faculty ratios will show greater retention risk, as larger class sizes limit access to faculty advising and individualized academic support.

**H3:** Institutions with higher proportions of international students will show lower retention risk. F-1 visa holders must maintain full-time enrollment to remain in the U.S. legally, which may structurally inflate retention rates relative to domestic students who have more flexibility to stop out or transfer.

---

## Methodology

I defined low retention as any institution with a full-time retention rate below 70%, a threshold commonly used in higher education research. This created a binary outcome variable (1 = at risk, 0 = healthy) used in logistic regression.

**Predictors included:**
- Total enrollment
- Proportion of Black students
- Proportion of Hispanic students
- Proportion of White students
- Proportion of international (non-resident alien) students
- Student-faculty ratio

The model was run in R using `glm()` with a binomial family. Predicted risk scores (0–1 probability) were generated for all 4,947 institutions and visualized in Tableau.

---

## Data Sources

All data sourced from the Integrated Postsecondary Education Data System (IPEDS), 2023-24 collection cycle, via the National Center for Education Statistics (NCES).

- **EF2024D**: Full-time and part-time retention rates by institution
- **EF2024A**: Fall enrollment by race/ethnicity and gender
- **HD2024**: Institutional directory (names, locations, sector)

---

## Tools & Methods

- **R** (tidyverse, ggplot2): data cleaning, logistic regression, exploratory visualization
- **Tableau Public**: interactive dashboard
- **GitHub**: version control and portfolio documentation

---

## Key Findings

- Black student enrollment proportion and student-faculty ratio were the strongest positive predictors of retention risk (p < 0.001), supporting H1 and H2
- Institutions classified as high risk averaged **55% full-time retention** compared to **85%** for healthy institutions, a 30-percentage-point gap
- International student enrollment was a significant *negative* predictor of risk (p < 0.001), consistent with the visa status hypothesis in H3
- White student proportion was not a statistically significant predictor (p = 0.12)
- Higher student-faculty ratios consistently predicted greater retention risk, pointing to the role of faculty access and advising in student persistence

---

## References

- National Center for Education Statistics. (2024). *Integrated Postsecondary Education Data System (IPEDS), 2023-24 data collection*. U.S. Department of Education. https://nces.ed.gov/ipeds/
- U.S. Immigration and Customs Enforcement. (2024). *Student and Exchange Visitor Program (SEVP): F-1 visa enrollment requirements*. https://www.ice.gov/sevis
- Tinto, V. (1987). *Leaving college: Rethinking the causes and cures of student attrition*. University of Chicago Press.
- Swail, W. S. (2004). *The art of student retention: A handbook for practitioners and administrators*. Educational Policy Institute.

- ---

## Live Dashboard

[View the interactive dashboard on Tableau Public](https://public.tableau.com/app/profile/khushi.samira.bhatt/viz/StudentRetentionRiskDashboardUSInstitutions/Dashboard1)

---

## Scripts

| Script | Description |
|---|---|
| `01_clean.R` | Loads, filters, and joins IPEDS data files |
| `02_analyze.R` | Runs logistic regression and generates predicted risk scores |
| `03_visualize.R` | Builds exploratory charts for each key predictor |
| `04_reshape.R` | Reshapes data to long format for Tableau |
| `05_add_names.R` | Joins institution names for dashboard tooltips |
