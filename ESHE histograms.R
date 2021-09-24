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
             x = "Year", y = "Nomina") + theme_minimal()
hist2 <- ggplot(df, aes(x=year)) + geom_histogram(binwidth = 2, color = "darkorange4", fill = "darkorange3")
hist2 + labs(title = "Nomina by year", 
             x = "Year", y = "Nomina") + theme_minimal()
hist5  <- ggplot(df, aes(x=year)) + geom_histogram(binwidth = 5, color = "darkorange4", fill = "darkorange3")
hist5 + labs(title = "Nomina by year", 
             x = "Year", y = "Nomina") + theme_minimal()
hist10 <- ggplot(df, aes(x=year)) + geom_histogram(binwidth = 10, color = "darkorange4", fill = "darkorange3")
hist10 + labs(title = "Nomina by year", 
              x = "Year", y = "Nomina") + theme_minimal()

g <- curl("https://raw.githubusercontent.com/raneyej/ESHE-2021/main/activenomina.csv")
h <- read.csv(g, header = TRUE, sep = ",")
head(h)
dfh <- data.frame(h)
active_hist10 <- ggplot(dfh, aes(x=year)) + geom_histogram(binwidth = 10, color = "darkorange4", fill = "darkorange3")
active_hist10 + labs(title = "Active nomina by year", 
                     x = "Year", y = "Nomina") + theme_minimal()
active_hist5 <- ggplot(dfh, aes(x=year)) + geom_histogram(binwidth = 5, color = "darkorange4", fill = "darkorange3")
active_hist5 + labs(title = "Active nomina by year", 
                    x = "Year", y = "Nomina") + theme_minimal()

p <- curl("https://raw.githubusercontent.com/raneyej/ESHE-2021/main/line4maybe.csv")
q <- read.csv(p, header = TRUE, sep = ",")
head(q)
dfq <- data.frame(q)
head(dfq)
line3 <- ggplot(dfq, aes(x=year, y=count)) + geom_line(color = "darkorange3") + geom_point(color = "darkorange4")
line3 + labs(title= "Cumulative nomina", x = "Year", y = "Nomina") + theme_minimal() 

s <- curl("https://raw.githubusercontent.com/raneyej/ESHE-2021/main/line4.csv")
t <- read.csv(s, header = TRUE, sep = ",")
head(t)
dft <- data.frame(t)
head(dft)

combo <- ggplot(df, aes(x=year), color = "darkorange4") + 
  geom_histogram(binwidth = 5, color = "darkorange4", fill = "darkorange3") +
  geom_line(dft, mapping = aes(x=year, y=decimal), color = "darkorange4", size = 2)
combo + labs(title = "Combined nomina by year and cumulative nomina", x = "Year", y = "Count") + theme_minimal()
