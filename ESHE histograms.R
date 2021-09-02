library(tidyverse)
library(curl)
library(ggplot2)
f <- curl("https://raw.githubusercontent.com/raneyej/ESHE-2021/main/nomina_export_edited3.csv")
d <- read.csv(f, header = TRUE, sep = ",")
head(d)
df <- data.frame(d)
head(df)
hist1 <- ggplot(df, aes(x=year)) + geom_histogram(color = "darkorange4", fill = "darkorange3")
hist1 + labs(title = "Nomina by year", 
             x = "Year", y = "Nomina")
hist2 <- ggplot(df, aes(x=year)) + geom_histogram(binwidth = 2, color = "darkorange4", fill = "darkorange3")
hist2 + labs(title = "Nomina by year", 
            x = "Year", y = "Nomina")
hist3  <- ggplot(df, aes(x=year)) + geom_histogram(binwidth = 5, color = "darkorange4", fill = "darkorange3")
hist3 + labs(title = "Nomina by year", 
             x = "Year", y = "Nomina")
hist4 <- ggplot(df, aes(x=year)) + geom_histogram(binwidth = 10, color = "darkorange4", fill = "darkorange3")
hist4 + labs(title = "Nomina by year", 
             x = "Year", y = "Nomina")