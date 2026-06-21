# ============================================
# Project 1: IPEDS Institutional Benchmarking
# Script 3: R Visualizations
# Author: Khushi Bhatt
# ============================================

library(tidyverse)
library(ggplot2)

# ---- Chart 1: 6-Year Graduation Rate ----

ggplot(master, aes(
  x    = reorder(instnm, grad_rate_6yr),
  y    = grad_rate_6yr,
  fill = instnm == "University at Albany"
)) +
  geom_col() +
  coord_flip() +
  scale_fill_manual(values = c("gray70", "#4B0082")) +
  labs(
    title    = "6-Year Graduation Rates (150% of Normal Time)",
    subtitle = "Peer Institution Comparison, 2023-24",
    x        = NULL,
    y        = "Graduation Rate (%)",
    caption  = "Source: IPEDS 2023-24, GR Survey"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

ggsave("outputs/chart_grad_6yr.png", width = 10, height = 6)

# ---- Chart 2: 4-Year Graduation Rate ----

ggplot(master |> filter(!is.na(grad_rate_4yr)), aes(
  x    = reorder(instnm, grad_rate_4yr),
  y    = grad_rate_4yr,
  fill = instnm == "University at Albany"
)) +
  geom_col() +
  coord_flip() +
  scale_fill_manual(values = c("gray70", "#4B0082")) +
  labs(
    title    = "4-Year Graduation Rates (100% of Normal Time)",
    subtitle = "Peer Institution Comparison, 2023-24 (8 of 11 schools reporting)",
    x        = NULL,
    y        = "Graduation Rate (%)",
    caption  = "Source: IPEDS 2023-24, GR Survey. Three schools did not report 4-year rate."
  ) +
  theme_minimal() +
  theme(legend.position = "none")

ggsave("outputs/chart_grad_4yr.png", width = 10, height = 6)

# ---- Chart 3: % Receiving Grant Aid ----

ggplot(master, aes(
  x    = reorder(instnm, pct_receiving_aid),
  y    = pct_receiving_aid,
  fill = instnm == "University at Albany"
)) +
  geom_col() +
  coord_flip() +
  scale_fill_manual(values = c("gray70", "#4B0082")) +
  labs(
    title    = "Percentage of Undergraduates Receiving Grant Aid",
    subtitle = "Peer Institution Comparison, 2023-24",
    x        = NULL,
    y        = "% Receiving Grant Aid",
    caption  = "Source: IPEDS 2023-24, SFA Survey"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

ggsave("outputs/chart_financial_aid.png", width = 10, height = 6)

# ---- Chart 4: Enrollment vs. 6-Year Grad Rate Scatter ----

ggplot(master, aes(
  x     = total_enrollment,
  y     = grad_rate_6yr,
  label = instnm
)) +
  geom_point(
    size  = 3,
    color = ifelse(master$instnm == "University at Albany", "#4B0082", "gray50")
  ) +
  geom_text(vjust = -0.8, size = 2.8) +
  labs(
    title    = "Enrollment Size vs. 6-Year Graduation Rate",
    subtitle = "Peer Institution Comparison, 2023-24",
    x        = "Total Undergraduate Enrollment",
    y        = "6-Year Graduation Rate (%)",
    caption  = "Source: IPEDS 2023-24"
  ) +
  theme_minimal()

ggsave("outputs/chart_scatter.png", width = 10, height = 6)

print("Script 3 complete. Four charts saved to outputs folder.")