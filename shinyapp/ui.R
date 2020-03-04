library(shiny)

# Define UI
shinyUI(fluidPage(
  
  # Application title
  headerPanel('Migration Data'),
  
  sidebarPanel(
    selectInput('country_selection', 'Country:',
                list('Argentina' = 'ARG',
                     'Bolivia' = 'BOL',
                     'Brazil' = 'BRA',
                     'Chile' = 'CHL',
                     'Colombia' = 'COL',
                     'Ecuador' = 'ECU',
                     'Guyana' = 'GUY',
                     'Peru' = 'PER',
                     'Paraguay' = 'PRY',
                     'Surinae' = 'SUR',
                     'Uruguay' = 'URY'
                     )),
    
  ),
  
  mainPanel(
    imageOutput('map', width = '100%', height = '100%'),
    plotOutput('big_plot'),
    plotOutput('test')
  )
))
