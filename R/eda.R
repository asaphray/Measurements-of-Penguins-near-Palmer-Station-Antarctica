# R/eda.R
# Exploratory Data Analysis (EDA) for Penguins Visualization Project

# Load required packages
source("R/setup.R")   # ensures packages are installed/loaded

library(palmerpenguins)
library(dplyr)
library(ggplot2)
library(tidyverse)

# Load data
data("penguins")

#  Inspect dataset
message("Preview of penguins dataset:")
print(head(penguins))

message("\nDataset structure:")
str(penguins)

message("\nMissing values per column:")
print(colSums(is.na(penguins)))

# Clean dataset
penguins_clean <- penguins %>%
  drop_na() %>% 
  mutate(
    sex = factor(sex),
    species = factor(species),
    island = factor(island)
  )

message("\nRows before cleaning: ", nrow(penguins))
message("Rows after cleaning: ", nrow(penguins_clean))

#Summary stats
message("\nSummary of numeric columns:")
print(summary(select(penguins_clean, where(is.numeric))))

message("\nCount by species and island:")
print(count(penguins_clean, species, island))

#Correlation matrix
num_vars <- penguins_clean %>% select(where(is.numeric))
corr_matrix <- cor(num_vars, use = "complete.obs")
message("\nCorrelation matrix:")
print(round(corr_matrix, 2))

#Feature engineering body_mass_kg & flipper_body_ratio
penguins_clean <- penguins_clean %>%
  mutate(
    body_mass_kg = body_mass_g / 1000,
    flipper_body_ratio = flipper_length_mm / body_mass_g
  )

message("\nNew features added: body_mass_kg, flipper_body_ratio")

# ---- 6. Save clean dataset ----
saveRDS(penguins_clean, "data/penguins_clean.rds")
message("\n✅ Clean dataset saved to data/penguins_clean.rds")

