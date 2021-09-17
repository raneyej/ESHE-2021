library(tidyverse)
library(curl)
library(ggplot2)
f <- curl("https://raw.githubusercontent.com/raneyej/ESHE-2021/main/nomina_export_edited3.csv")
d <- read.csv(f, header = TRUE, sep = ",")
head(d)
df <- data.frame(d)
head(df)
df
hist1 <- ggplot(df, aes(x=year)) + geom_histogram(binwidth = 1, color = "darkorange4", fill = "darkorange3")
hist1 + labs(title = "Nomina by year", 
             x = "Year", y = "Nomina")
hist2 <- ggplot(df, aes(x=year)) + geom_histogram(binwidth = 2, color = "darkorange4", fill = "darkorange3")
hist2 + labs(title = "Nomina by year", 
             x = "Year", y = "Nomina")
hist5  <- ggplot(df, aes(x=year)) + geom_histogram(binwidth = 5, color = "darkorange4", fill = "darkorange3")
hist5 + labs(title = "Nomina by year", 
             x = "Year", y = "Nomina")
hist10 <- ggplot(df, aes(x=year)) + geom_histogram(binwidth = 10, color = "darkorange4", fill = "darkorange3")
hist10 + labs(title = "Nomina by year", 
              x = "Year", y = "Nomina")

g <- curl("https://raw.githubusercontent.com/raneyej/ESHE-2021/main/activenomina.csv")
h <- read.csv(g, header = TRUE, sep = ",")
head(h)
dfh <- data.frame(h)
head(df2)
active_hist10 <- ggplot(dfh, aes(x=year)) + geom_histogram(binwidth = 10, color = "darkorange4", fill = "darkorange3")
active_hist10 + labs(title = "Active nomina by year", 
             x = "Year", y = "Nomina")
active_hist5 <- ggplot(dfh, aes(x=year)) + geom_histogram(binwidth = 5, color = "darkorange4", fill = "darkorange3")
active_hist5 + labs(title = "Active nomina by year", 
             x = "Year", y = "Nomina")

p <- curl("https://raw.githubusercontent.com/raneyej/ESHE-2021/main/line4maybe.csv")
q <- read.csv(p, header = TRUE, sep = ",")
head(q)
dfq <- data.frame(q)
head(dfq)
line3 <- ggplot(dfq, aes(x=year, y=count)) + geom_line(color = "darkorange3") + geom_point(color = "darkorange4")
line3 + labs(title= "Nomina by year", x = "Year", y = "Nomina") + theme_minimal()
