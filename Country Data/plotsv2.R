library(tidyverse)
data = read_csv("Country Data/API_Download_DS2_en_csv_v2_792501.csv")
colnames(data) = c("country", "indicator", c(1960:2007))

countries = unique(data$country)
indicators = unique(data$indicator)
important = c(
  "Population growth (annual %)",
  "Official exchange rate (LCU per US$, period average)",
  "Fertility rate, total (births per woman)",
  "Life expectancy at birth, total (years)",
  "GDP per capita (constant LCU)"
)
countries = countries[!countries %in% "ECU"]

total = data[0,]

for (country in countries) {
  df = data[which(data$country == country),]
  df = df[match(important, indicators),]
  total = rbind(total, df)
}

library(reshape2)
df = melt(total)
df$variable = as.numeric(as.character(df$variable))

ven_data = df[df$country == "VEN",]
df = merge(df, ven_data, by = c("variable", 'indicator'))
colnames(df) = c('year', 'indicator', 'country', 'val', 'VEN', 'valVEN')

library(ggplot2)
p = ggplot() +
  geom_line(data = df, aes(x = year, y = val), color = 'blue') +
  geom_line(data = df, aes(x = year, y = valVEN), color = 'red') +
  facet_grid(
    cols = vars(country),
    rows = vars(indicator),
    scales = 'free'
  ) +
  theme_bw()
p

dataSubset = df[union(which(df$country %in% 'ARG'), which(df$country %in% 'VEN')), ]

testPlot = ggplot() +
  geom_line(data = dataSubset, aes(x = year, y = val), color = 'blue') +
  geom_line(data = dataSubset, aes(x = year, y = valVEN), color = 'red') +
  facet_grid(
    cols = vars(country),
    rows = vars(indicator),
    scales = 'free'
  ) +
  theme_bw()
testPlot