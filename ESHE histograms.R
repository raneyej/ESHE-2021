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
df2 <- data.frame(h)
head(df2)
active_hist1 <- ggplot(df2, aes(x=year)) + geom_histogram(binwidth = 10, color = "darkorange4", fill = "darkorange3")
active_hist1 + labs(title = "Active nomina by year", 
             x = "Year", y = "Nomina")
active_hist2 <- ggplot(df2, aes(x=year)) + geom_histogram(binwidth = 5, color = "darkorange4", fill = "darkorange3")
active_hist2 + labs(title = "Active nomina by year", 
             x = "Year", y = "Nomina")

j <- curl("https://raw.githubusercontent.com/raneyej/ESHE-2021/main/nominaline.csv")
k <- read.csv(j, header = TRUE, sep = ",")
head(k)
dfk <- data.frame(k)
head(dfk)
line1 <- ggplot(dfk, aes(x=year, y =count)) +geom_line() +geom_point() +ylim(0, 10)
line1

m <- curl("https://raw.githubusercontent.com/raneyej/ESHE-2021/main/line2.csv")
n <- read.csv(m, header = TRUE, sep = ",")
head(n)
dfn <- data.frame(n)
head(dfn)
line2 <- ggplot(dfn, aes(x=year, y=count)) +geom_line(color = "darkorange3") +geom_point(color = "darkorange4") +ylim(0, 10) +xlim(1750, 2021)
line2 + labs(title= "Nomina by year", 
             x = "Year", y = "Nomina")
p <- curl("https://raw.githubusercontent.com/raneyej/ESHE-2021/main/line4maybe.csv")
q <- read.csv(p, header = TRUE, sep = ",")
head(q)
dfq <- data.frame(q)
head(dfq)
line3 <- ggplot(dfq, aes(x=year, y=count)) + geom_line(color = "darkorange3") + geom_point(color = "darkorange4")
line3 + labs(title= "Nomina by year", x = "Year", y = "Nomina") + theme_minimal()
