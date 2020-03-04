library(shiny)

# Load data set
library(tidyverse)
data = read.csv("~/Github/sa-migration/Country Data/API_Download_DS2_en_csv_v2_792501.csv")
colnames(data)= c("country", "indicator", c(1960:2019))

data = data[, c(1, 2, 43:62)]

countries = unique(data$country)
indicators = unique(data$indicator)
important = c("Population growth (annual %)",
              "Fertility rate, total (births per woman)",
              "Life expectancy at birth, total (years)",
              "GDP per capita (constant LCU)")

total = data[0, ]

for (country in countries) {
  df = data[which(data$country == country), ]
  df = df[match(important, indicators), ]
  total = rbind(total, df)
}

library(reshape2)
df = melt(total)
df$variable = as.numeric(as.character(df$variable))

ven_data = df[df$country == "VEN", ]
df = merge(df, ven_data, by = c("variable", 'indicator'))
colnames(df) = c('year', 'indicator', 'country', 'val', 'VEN', 'valVEN')

library(ggplot2)

# Define server logic
shinyServer(function(input,output) {
  
  output$test = renderPlot({
    ggplot() +
      geom_line(data = df[which(df$country %in% input$country_selection),], aes(x = year, y = val), color = 'blue') +
      geom_line(data = df[union(which(df$country %in% input$country_selection), which(df$country %in% 'VEN')),], aes(x = year, y = valVEN), color = 'red') +
      facet_grid(cols = vars(country), rows = vars(indicator), scales = 'free') +
      theme_bw()
  })
  
  output$map = renderImage({
    list(src = 'south_am.jpg')
  }, deleteFile = F)
  
})