library(tidyverse)
data <- read_csv("Country Data/API_Download_DS2_en_csv_v2_792501.csv")
colnames(data)<- c("country", "indicator", c(1960:2007))

library(reshape2)
test <- melt(data)
colnames(test) <- c("country", "indicator", "year", "val")
test$year <- as.numeric(as.character(test$year))
test1 <- test[test$country == "ARG",]

unqind <- unique(test$indicator)
unqind <- unqind[c(1, 9, 100)]

test <- test[which(test$indicator %in% unqind),]

ven <- test[test$country == "VEN",]
df <- merge(test, ven, by = c("year", 'indicator'))

library(ggplot2)
p <- ggplot() + 
  geom_line(data = df, aes(x = year, y = val.x), color = 'blue') + 
  geom_line(data = df, aes(x = year, y = val.y), color = 'red') + 
  facet_grid(cols = vars(country.x), rows = vars(indicator), scales = 'free') + 
  theme_bw()
p
