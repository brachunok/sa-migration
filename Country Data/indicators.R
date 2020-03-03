library(tidyverse)
data = read_csv("~/Github/sa-migration/Country Data/API_Download_DS2_en_csv_v2_792501.csv")
colnames(data)= c("country", "indicator", c(1960:2007))

countries = unique(data$country)
indicators = unique(data$indicator)

test = data
test[, 3:50] = !is.na(test[, 3:50])

x = integer(length(indicators))
y = integer(length(countries))

for (i in 1:length(indicators)) {
  df = test[which(test$indicator == indicators[i]),3:50]
  y = rowSums(df)
  x[i] = sum(y)
}

indicators[(which(x > 570))]
