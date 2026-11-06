library(ggplot2)
#Set plotting theme
theme_set(
  theme_bw() +
  ggplot2::theme(
    plot.title = element_text(face="bold", hjust=0.5, size=20),
    plot.subtitle = element_text(hjust=0.5, size=16),
    axis.title.y = element_text(face="bold",vjust=5, size=16),
    axis.text.y = element_text(size=16),
    # No x-axis
    axis.text.x = element_blank(),  
    axis.title.x = element_blank(),
    axis.ticks.x = element_blank(),
    plot.caption = element_text(size = 12, vjust = -5),
    plot.margin = ggplot2::margin(t=10, r=5, b=20, l=20),
    legend.text = element_text(size=12),
    legend.title = element_text(size=16, face="bold", hjust=0.5),
    legend.background = element_rect(fill="white", linewidth=1, linetype="solid", color="black"),
    panel.border = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    axis.line = element_line(color = "black")
  )
)
