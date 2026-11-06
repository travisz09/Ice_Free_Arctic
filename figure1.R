library(readxl)
library(tidyverse)
library(cowplot)
source('ggplot_Theme.R')  # Use this file to adjust chart themes
data = read_excel('data/Projecting an Ice Free Arctic - Datasheet.xlsx')
data_long = data |>
    gather(key = type, value = value, -Community)

# Base gannt chart like plot
baseplot = ggplot(data_long, aes(value, Community)) +
    geom_line(linewidth = 10, color = 'blue', lineend = 'round') 


# Gradient arrow body
arrow <- data.frame(
  x = seq(0, 10, length.out = 500),
  y = 0
)

col1 = '#67a9cf'
col2 = '#f7f7f7'
col3 = '#ef8a62'

arrowplot = ggplot(arrow, aes(x, y, color = x)) +
  geom_line(
    linewidth = 5,
    lineend = "round"
  ) +
  # Arrowhead
  annotate(
    "polygon",
    x = c(10, 10, 10.7),
    y = c(-0.35, 0.35, 0),
    fill = col3
  ) +
  # Labels
  annotate("text", x = 0,  y = 0, size = 4, fontface = 'bold', family = "serif",
    label = 'THICK, SAFE ICE\n\nPREDICTABLE') +
  annotate("text", x = 5,  y = 0, size = 4, fontface = 'bold', family = "serif",
    label = 'THIN, UNSAFE ICE\n\nUNPREDICTABLE',) +
  annotate("text", x = 10, y = 0, size = 4, fontface = 'bold', family = "serif",
    label = 'NO ICE\n\nPREDICTABLE') +
  scale_color_gradient2(
    low = col1,
    mid = col2,
    high = col3,
    midpoint = 5
  ) +
  coord_cartesian(
    xlim = c(-0.5, 11),
    ylim = c(-1, 1.2),
    clip = "off"
  ) +
  theme_void() +
  theme(legend.position = "none")

# Compine plot elements
finalplot = ggdraw() +
  draw_plot(
    # Base Gantt Chart
    baseplot,
    x = 0.05,
    y = 0.05,
    width = 0.9,
    height = 0.8
  ) +
  draw_plot(
    # Arrow Graphic
    arrowplot,
    x = 0.35,
    y = 0.85,
    width = 0.65,
    height = 0.15
  )
finalplot
ggsave('Figure1.png', finalplot, dpi = 300, width = 8.5, height = 5, units = 'in', bg = "white")

