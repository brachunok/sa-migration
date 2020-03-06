library(shiny)

# Load data set
library(tidyverse)
data = read.csv("../Country Data/API_Download_DS2_en_csv_v2_792501.csv")
colnames(data) = c("country", "indicator", c(1960:2019))

data = data[, c(1, 2, 43:62)]

countries = unique(data$country)
countries = as.character(countries)
indicators = unique(data$indicator)
important = c(
  "Population growth (annual %)",
  "Net official development assistance received (current US$)",
  "Life expectancy at birth, total (years)",
  "GDP per capita (constant LCU)",
  "GDP deflator (base year varies by country)"
)

total = data[0,]

for (country in countries) {
  df = data[which(data$country == country),]
  df = df[match(important, indicators),]
  total = rbind(total, df)
}

library(reshape2)
df = melt(total)
df$variable = as.numeric(as.character(df$variable))
colnames(df) = c('country', 'indicator', 'year', 'val')

library(ggplot2)
theme_set(theme_bw() + theme(legend.position = 'bottom'))

country_text = readLines('./country_text.txt')

# Define server logic
shinyServer(function(input, output) {
  output$test = renderPlot({
    ggplot() +
      geom_line(data = df[which(df$country %in% input$country_selection), ], aes(x = year, y = val), color = '#7FA998') +
      geom_line(data = df[which(df$country %in% 'VEN'), ], aes(x = year, y = val), color = '#9D2503') +
      facet_wrap(indicator~., scales = 'free') +
      ylab('Value') + xlab('Year')
  })
  
  output$map = renderImage({
    list(src = paste(input$country_selection, '_map.jpg', sep = ''), width = '140%', height = '140%')
  }, deleteFile = F)
  
  output$country_name = renderText({
    get_name(input$country_selection)
  })
  
  output$description = renderText({
    country_text[match(input$country_selection, countries)]
  })
  
})

get_name = function(abbr) {
  if (abbr == 'ARG') {
    x = 'Argentina'
  } else if (abbr == 'BOL') {
    x = 'Bolivia'
  } else if (abbr == 'BRA') {
    x = 'Brazil'
  } else if (abbr == 'CHL') {
    x = 'Chile'
  } else if (abbr == 'COL') {
    x = 'Colombia'
  } else if (abbr == 'ECU') {
    x = 'Ecuador'
  } else if (abbr == 'GUY') {
    x = 'Guyana'
  } else if (abbr == 'PER') {
    x = 'Peru'
  } else if (abbr == 'PRY') {
    x = 'Paraguay'
  } else if (abbr == 'SUR') {
    x = 'Suriname'
  } else {
    x = 'Uruguay'
  }
  
  return(x)
}
