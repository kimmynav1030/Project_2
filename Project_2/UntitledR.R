library(shiny)
library(ggplot2)

# Read the CSV file
emissions <- read.csv("/Users/kimberlynavarro/Desktop/Project_2/Emissions.csv")

# Define UI
ui <- fluidPage(
  titlePanel("Emission Analysis"),
  mainPanel(
    plotOutput("plot1"),
    plotOutput("plot2") 
  )
)

# Define server logic
server <- function(input, output) {
  
  # Function to generate bar chart based on user selection
  output$plot1 <- renderPlot({
    ggplot(emissions, aes(x = Sub, y = Subglobal)) +
      geom_bar(stat = "identity", fill = "lightpink") +
      labs(title = "Emissions by Sub Sector",
           y = "Total Emissions",
           x = NULL) +  # Removed x-axis title
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
  })
  
  output$plot2 <- renderPlot({
    ggplot(emissions, aes(x = Industries, y = Emissions)) +
      geom_bar(stat = "identity", fill = "skyblue") +
      labs(title = "Total Emissions by Industry",
           y = "Total Emissions",
           x = NULL) +  # Removed x-axis title
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
  })
  
}
# Run the application
shinyApp(ui = ui, server = server)
