library(shiny)

# Define UI
shinyUI(fluidPage(
  
  # Application title
  headerPanel('Migration Data'),
  
  
  fluidRow(
    
    column(1,
           radioButtons('country_selection', 'Country:',
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
                        ))
           
           
           
    ),
    column(2, imageOutput('map', width = '100%', height = '100%'),
    ),
    column(3,
           plotOutput('test'), width = 4, height = 200)
  ),
  
  # sidebarPanel(
  #   selectInput('country_selection', 'Country:',
  #               list('Argentina' = 'ARG',
  #                    'Bolivia' = 'BOL',
  #                    'Brazil' = 'BRA',
  #                    'Chile' = 'CHL',
  #                    'Colombia' = 'COL',
  #                    'Ecuador' = 'ECU',
  #                    'Guyana' = 'GUY',
  #                    'Peru' = 'PER',
  #                    'Paraguay' = 'PRY',
  #                    'Surinae' = 'SUR',
  #                    'Uruguay' = 'URY'
  #                    )),
  #   
  # ),
  
  
))
