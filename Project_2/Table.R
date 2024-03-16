# Kimmy Navarro
# Project 2
# 2024-03-15
# Professor Yee May Seah

# Load necessary libraries
library(shiny)
library(shinythemes)
library(ggplot2)

# Read the CSV file
emissions <- read.csv("/Users/kimberlynavarro/Desktop/Project_2/Emissions.csv")

ui <- fluidPage(
  theme = shinytheme("darkly"),
  titlePanel("Total Emissions Across Industries"),
  mainPanel(
    plotOutput("plot1")
  )
)

server <- function(input, output) {
  
  output$plot1 <- renderPlot({
    # Assuming your dataset contains a column named "Industries"
    # Convert "Industries" column to factor to preserve order
    emissions$Industries <- factor(emissions$Industries, levels = unique(emissions$Industries))
    
    # Plot barplot
    barplot(table(emissions$Industries),
            main = "Emissions per Industry",
            col = "blue",
            las = 2, #setting x-axis vertical
            ylab = emissions$Emissions,
            ylim = c(0,20))
            
  })
}

shinyApp(ui = ui, server = server)
