library(ggplot2)
library(scales)
library(curl)
library(tidyverse)
library(lubridate)
x <- curl("https://raw.githubusercontent.com/raneyej/ESHE-2021/main/activenomina_genus.csv")
y <- read.csv(x, header = TRUE, sep = ",")
head(y)
dfy <- data.frame(y)
head(dfy)
dfy <- dfy[-c(1), ]
genera <- c("Orrorin", "Sahelanthropus", "Ardipithecus", "Australopithecus", "Kenyanthropus", "Zinjanthropus", "Paranthropus", "Paraustralopithecus", "Homo")
genera_colors <- c("hotpink1", "firebrick1", "darkorange", "gold", "green2", "skyblue1", "royalblue2", "violet", "violetred")
dfy$genus <- factor(dfy$genus, levels = genera, ordered = TRUE)
positions <- c(-2.5, -2, -1.5, -1, -0.5, 0.5, 1, 1.5, 2)
directions <- c(-1, 1)
line_pos <- data.frame(
  "year"=unique(dfy$year), 
  "position"=rep(positions, length.out=length(unique(dfy$year))), 
  "direction"=rep(directions, length.out=length(unique(dfy$year)))
)
dfy <- merge(x=dfy, y=line_pos, by="year", all = TRUE)
dfy <- dfy[with(dfy, order(year, genus)), ]
head(dfy)
text_offset <- 0.05
dfy$year_count <- ave(dfy$year==dfy$year, df$year, FUN=cumsum)
dfy$text_position <- (dfy$year_count * text_offset * dfy$direction) + dfy$position
head(dfy)

year_buffer <- 2
year_date_range <- seq(min(df$year) -years(year_buffer), max(dfy$year))
year_format <- format(year_date_range)
year_df <- data.frame(year_date_range, year_format)
year_df <- year_df[-c(1:98), ]

timeline_plot <- ggplot(dfy, aes(x=year, y=0, col=name))
timeline_plot <- timeline_plot + labs(col="Nomina")
timeline_plot <- timeline_plot + theme_classic()

timeline_plot <- timeline_plot + geom_hline(yintercept=0, color="black", size=0.3)
timeline_plot <- timeline_plot + geom_segment(data=dfy[dfy$year_count == 1,], 
                                              aes(y=position, yend=0, xend=year), color="black", size=0.2)
timeline_plot <- timeline_plot + geom_point(aes(y=0), size=3)
timeline_plot <- timeline_plot + theme(axis.line.y=element_blank(),
                                       axis.text.y=element_blank(),
                                       axis.title.x=element_blank(),
                                       axis.title.y=element_blank(),
                                       axis.ticks.y=element_blank(),
                                       axis.text.x =element_blank(),
                                       axis.ticks.x =element_blank(),
                                       axis.line.x =element_blank(),
                                       legend.position = "none"
)
timeline_plot <- timeline_plot+geom_text(aes(y=text_position, label=name), size=2.5)
timeline_plot + labs(title = "Nomina timeline")
