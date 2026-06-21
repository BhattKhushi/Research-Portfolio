# ============================================
# Project 1: IPEDS Institutional Benchmarking
# Script 1: Load and Clean Data
# Author: Khushi Bhatt
# ============================================

library(tidyverse)
library(readr)
library(janitor)

# ---- Peer institution set ----
# Source: UAlbany's official 2024 IPEDS Data Feedback Report

peer_ids <- c(
  196060,  # University at Albany, SUNY (anchor school)
  196079,  # Binghamton University
  196097,  # Stony Brook University
  196088,  # University at Buffalo
  129020,  # University of Connecticut
  231174,  # University of Vermont
  232982,  # Old Dominion University
  147703,  # Northern Illinois University
  240453,  # University of Wisconsin-Milwaukee
  209551,  # University of Oregon
  126614   # University of Colorado Boulder
)

# ---- Load IPEDS files ----
hd  <- read_csv("data/hd2024.csv")   |> clean_names()
ef  <- read_csv("data/ef2024a.csv")  |> clean_names()
gr  <- read_csv("data/gr2024.csv")   |> clean_names()
sfa <- read_csv("data/sfa2324.csv")  |> clean_names()

# ---- Filter to peer schools only ----
hd_peers  <- hd  |> filter(unitid %in% peer_ids)
ef_peers  <- ef  |> filter(unitid %in% peer_ids)
gr_peers  <- gr  |> filter(unitid %in% peer_ids)
sfa_peers <- sfa |> filter(unitid %in% peer_ids)

# ---- Verify row counts ----
nrow(hd_peers)
nrow(sfa_peers)

# ---- School name lookup ----
school_names <- hd_peers |> select(unitid, instnm, stabbr, control)

print("Script 1 complete.")