library(shiny)

# Define UI
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel('Migration Data'),
  
  sidebarPanel(
    selectInput('country_selection', 'Country:',
                list('Argentina' = countries[1],
                     'Bolivia' = countries[2],
                     'Brazil' = countries[3],
                     'Chile' = countries[4],
                     'Colombia' = countries[5],
                     'Ecuador' = countries[6],
                     'Guyana' = countries[7],
                     'Peru' = countries[8],
                     'Paraguay' = countries[9],
                     'Suriname' = countries[10],
                     'Uruguay' = countries[11]
                     )),
    
    
  ),
  
  mainPanel(
    # plotOutput('test'),
    plotOutput('big_plot')
  )
))
