#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("What Did Trump Do Now?"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        sliderInput("frequency",
                     "Number of words:",
                     min = 1,
                     max = 50,
                     value = 30)
        ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("word_cloud")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$word_cloud <- renderPlot({
      word_bag <- clean_data()
      final_scoring <- sentiments_score(word_bag)
      get_cloud(input$frequency, final_scoring)
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

