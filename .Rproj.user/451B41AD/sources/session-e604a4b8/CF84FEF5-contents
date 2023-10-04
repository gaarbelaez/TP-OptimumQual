# Activity 5: Designing an SPC Dashboard in R Studio
#
# Interactive Visualization with R Shiny:

# Load the required packages
library(shiny)
library(ggplot2)
library(qcc)


data(pistonrings) #données example de pistons
attach(pistonrings) # permet de dire à qcc que nous nous referons aux données lors de l'appel de la fonction
diameter <- qcc.groups(diameter, sample) #on va creer les données diametre avec les diametre et les sous groups seront les "sample"
data<-diameter

# Define UI
ui <- fluidPage(
  titlePanel("MSP/SPC Dashboard"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("data_points",
                  "Number of datapoints:",
                  min = 1,
                  max = 40,
                  value = 25)
    ),

    mainPanel(
      # Include output elements, such as control charts and visualizations
      plotOutput("control_chart"),
      # Other visualizations and summary statistics
    )
  )
)

# Define Server
server <- function(input, output) {
  # Code to generate control charts and other visualizations

  output$control_chart <- renderPlot({
    # Generate control chart plot
    # Example: X-bar and R chart
    qcc(data[1:input$data_points,], type = "xbar")

  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
