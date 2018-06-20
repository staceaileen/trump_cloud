#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ECharts2Shiny)
library(wordcloud2)
library(TweetBase)
library(dplyr)
library(tidyr)
library(stringr)
library(RCurl)
library(twitteR)
library(tidytext)
library(shinythemes)
library(lubridate)

# Define UI for application that draws a histogram
ui <- fluidPage(theme = shinytheme("superhero"),
   
   # Application title
   titlePanel("What Did Trump Do Now?"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        sliderInput("frequency",
                     "Number of words:",
                     min = 1,
                     max = 30,
                     value = 20),
        
      
      dateInput("date", "From day:", value = as.character(today()-1), min = as.character(today() - 7), max = as.character(today()-1),
                format = "yyyy-mm-dd", startview = "month", weekstart = 0,
                language = "en", width = NULL)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         wordcloud2Output('word_cloud')
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$word_cloud <- renderWordcloud2({
      d <- tweets(input$date)
      word_bag <- clean_data(d)
      final_scoring <- sentiments_score(word_bag)
      (get_cloud(input$frequency, final_scoring))
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

