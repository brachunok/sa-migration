library(shiny)

# Define UI
shinyUI(fluidPage(
  # Application title
  titlePanel('Migration Data'),
  
  fluidRow(
    "We decided to look at the factors that led to the Venezuelan migration crisis. Venezuela has been in a
    major economic crisis since 2010, and low oil prices have worsened the crisis. Hyperinflation has followed, 
    and the conditions led many to leave the country as migrants, typically to other South American countries. 
    This has caused a crisis in some countries such as Colombia who have difficulty accepting the large amount 
    of migrants.As you look through some selected social and economic indicators, we urge you to consider how 
    people are pushed to move to places where they believe they will do better, and how the geography impacts this."
  ),
  
  fluidRow(
    column(radioButtons(
      'country_selection',
      'Country:',
      list(
        'Argentina' = 'ARG',
        'Bolivia' = 'BOL',
        'Brazil' = 'BRA',
        'Chile' = 'CHL',
        'Colombia' = 'COL',
        'Ecuador' = 'ECU',
        'Guyana' = 'GUY',
        'Peru' = 'PER',
        'Paraguay' = 'PRY',
        'Suriname' = 'SUR',
        'Uruguay' = 'URY'
      )
    ), width = 1),
    
    column(imageOutput(
      'map', width = 'auto', height = 'auto'), width = 3),
    
    column(plotOutput('test', height = 750), width = 3),
    
    column(h3(textOutput('country_name')), textOutput('description'), width = 2)
  ),
  
  fluidRow(
    'Sources: https://data.worldbank.org/,
                https://en.wikipedia.org/wiki/Crisis_in_Venezuela'
  )
))
