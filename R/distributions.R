# R/distributions.R
# Distribution visualizations for Palmer Penguins dataset

library(tidyverse)
library(palmerpenguins)
library(forcats)

# Load cleaned data
penguins <- readRDS("data/penguins_clean.rds")

# 1. Species counts (bar plot)
p4 <- penguins %>%
  ggplot(aes(species)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Distribution of Penguin Species") +
  theme_minimal()

ggsave("outputs/plots/species_counts.png", p4, width = 6, height = 4)


# 2. Reordered species counts (most frequent first)
p5 <- penguins %>%
  ggplot(aes(x = fct_infreq(species))) +
  geom_bar(fill = "darkorange") +
  labs(title = "Penguin Species (Ordered by Frequency)", x = "Species") +
  theme_minimal()

ggsave("outputs/plots/species_counts_ordered.png", p5, width = 6, height = 4)


# 3. Histogram of body mass
p6 <- penguins %>%
  ggplot(aes(body_mass_g)) +
  geom_histogram(binwidth = 200, fill = "forestgreen", color = "white") +
  labs(title = "Distribution of Penguin Body Mass", x = "Body mass (g)") +
  theme_minimal()

ggsave("outputs/plots/bodymass_histogram.png", p6, width = 6, height = 4)


# 4. Density plot of body mass
p7 <- penguins %>%
  ggplot(aes(body_mass_g, fill = species)) +
  geom_density(alpha = 0.6) +
  labs(title = "Density of Body Mass by Species", x = "Body mass (g)") +
  theme_minimal()

ggsave("outputs/plots/bodymass_density.png", p7, width = 6, height = 4)
