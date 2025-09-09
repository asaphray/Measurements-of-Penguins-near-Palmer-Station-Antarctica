# setup.R
# Bootstrap script for Penguins Visualization Project
# - Installs & loads required packages
# - Creates the standard project folder structure
# - Adds placeholder files if missing

# ----------------------------
# 1. Required packages
# ----------------------------
packages <- c(
  "tidyverse",      # ggplot2, dplyr, tidyr, readr, etc.
  "palmerpenguins", # dataset
  "ggthemes",       # extra ggplot themes
  "forcats"         # categorical variable handling
)

install_if_missing <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg, dependencies = TRUE)
  }
  library(pkg, character.only = TRUE)
}

invisible(lapply(packages, install_if_missing))
message("✅ All required packages are installed and loaded.")

# ----------------------------
# 2. Project folder structure
# ----------------------------
folders <- c(
  "R",
  "data",
  "outputs/plots",
  "notebooks"
)

for (f in folders) {
  if (!dir.exists(f)) {
    dir.create(f, recursive = TRUE)
    message(paste("📁 Created folder:", f))
  }
}

# ----------------------------
# 3. Starter files
# ----------------------------

# README.md
if (!file.exists("README.md")) {
  writeLines(c(
    "# 🐧 Penguins Visualization Project",
    "",
    "This project explores the Palmer Penguins dataset using R.",
    "It includes EDA, feature engineering, and visualizations with ggplot2."
  ), "README.md")
  message("📝 Created README.md")
}

# .gitignore
if (!file.exists(".gitignore")) {
  writeLines(c(
    ".Rhistory",
    ".RData",
    ".Rproj.user/",
    "outputs/"
  ), ".gitignore")
  message("📝 Created .gitignore")
}

# R scripts
script_files <- c("eda.R", "scatterplots.R", "distributions.R")
for (s in script_files) {
  path <- file.path("R", s)
  if (!file.exists(path)) {
    file.create(path)
    message(paste("📝 Created", path))
  }
}

# Notebook placeholder
nb_path <- file.path("notebooks", "penguins-analysis.Rmd")
if (!file.exists(nb_path)) {
  writeLines(c(
    "---",
    "title: \"Penguins Analysis\"",
    "author: \"Your Name\"",
    "output: html_document",
    "---",
    "",
    "# Introduction",
    "",
    "This report explores the Palmer Penguins dataset."
  ), nb_path)
  message("📝 Created notebooks/penguins-analysis.Rmd")
}

message("✅ Project setup complete.")
