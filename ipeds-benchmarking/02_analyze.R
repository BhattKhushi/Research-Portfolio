# ============================================
# Project 1: IPEDS Institutional Benchmarking
# Script 2: Build Peer Comparison Table
# Author: Khushi Bhatt
# ============================================

library(tidyverse)
library(writexl)

# ---- Metric 1: 6-Year Graduation Rate ----
# grtype 2 = adjusted cohort (denominator)
# grtype 3 = completers within 150% of normal time (numerator)

gr_cohort <- gr_peers |> filter(grtype == 2) |>
  select(unitid, grtotlt) |> rename(cohort = grtotlt)

gr_completers_150 <- gr_peers |> filter(grtype == 3) |>
  select(unitid, grtotlt) |> rename(comp_150 = grtotlt)

grad_6yr <- gr_cohort |>
  left_join(gr_completers_150, by = "unitid") |>
  mutate(grad_rate_6yr = round(comp_150 / cohort * 100, 1)) |>
  select(unitid, grad_rate_6yr)

# ---- Metric 2: 4-Year Graduation Rate ----
# grtype 4 = completers within 100% of normal time (numerator)

gr_completers_100 <- gr_peers |> filter(grtype == 4) |>
  select(unitid, grtotlt) |> rename(comp_100 = grtotlt)

grad_4yr <- gr_cohort |>
  left_join(gr_completers_100, by = "unitid") |>
  mutate(grad_rate_4yr = round(comp_100 / cohort * 100, 1)) |>
  select(unitid, grad_rate_4yr)

# ---- Metric 3: Total undergraduate enrollment ----
enrollment <- ef_peers |>
  filter(efalevel == 1) |>
  select(unitid, eftotlt) |>
  rename(total_enrollment = eftotlt)

# ---- Metric 4: % undergrads receiving grant aid ----
financial_aid <- sfa_peers |>
  select(unitid, uagrntp) |>
  rename(pct_receiving_aid = uagrntp)

# ---- Join everything into one master table ----
master <- school_names |>
  left_join(grad_6yr,      by = "unitid") |>
  left_join(grad_4yr,      by = "unitid") |>
  left_join(enrollment,    by = "unitid") |>
  left_join(financial_aid, by = "unitid")

# ---- View and export ----
View(master)

write_xlsx(master, "outputs/peer_comparison.xlsx")

print("Script 2 complete. Check outputs/peer_comparison.xlsx")