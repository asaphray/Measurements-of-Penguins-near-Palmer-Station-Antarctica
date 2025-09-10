# R/scatterplots.R
# Scatterplot visualizations for Palmer Penguins dataset

library(tidyverse)
library(palmerpenguins)
library(ggthemes)

# Load cleaned data
penguins <- readRDS("data/penguins_clean.rds")

# 1. Body mass vs flipper length (species as color)
p1 <- penguins %>%
  ggplot(aes(flipper_length_mm, body_mass_g, colour = species)) +
  geom_point(size = 4, alpha = 0.6) +
  geom_smooth(method = lm, se = FALSE) +
  labs(
    title = "Body Mass vs Flipper Length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)"
  ) +
  theme_classic()

ggsave("outputs/plots/bodymass_flipper.png", p1, width = 7, height = 5)


# 2. Bill depth vs bill length (species as color/shape)
p2 <- penguins %>%
  ggplot(aes(bill_length_mm, bill_depth_mm, color = species, shape = species)) +
  geom_point(size = 3, alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Bill Depth vs Bill Length",
    subtitle = "Differences among Penguin Species",
    x = "Bill length (mm)", y = "Bill depth (mm)"
  ) +
  theme_stata()

ggsave("outputs/plots/bill_depth_length.png", p2, width = 7, height = 5)


# 3. Flipper length vs body mass (bill depth mapped to color gradient)
p3 <- penguins %>%
  ggplot(aes(body_mass_g, flipper_length_mm)) +
  geom_point(aes(color = bill_depth_mm), alpha = 0.6, size = 3) +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(
    title = "Flipper Length vs Body Mass",
    subtitle = "Bill depth shown as color gradient",
    x = "Body mass (g)", y = "Flipper length (mm)", color = "Bill depth"
  ) +
  theme_stata()

ggsave("outputs/plots/flipper_bodymass_billdepth.png", p3, width = 7, height = 5)
