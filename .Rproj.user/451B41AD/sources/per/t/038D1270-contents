#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#

# Load the required packages
library(shiny)
library(ggplot2)
library(qcc)
library(readr)


# Import and inspect the dataset
dataset <- read_csv("manufacturing_data.csv")
dataset_l <- dataset %>% select(Length_cm.1:Length_cm.5)
meanDataset <- mean(dataset_l$Length_cm.1)


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
  titlePanel("MSP/SPC tableau de bord"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("data_points",
                  "Number of datapoints:",
                  min = 1,
                  max = 40,
                  value = 25)
    ),
        # Show a plot of the generated distribution
        mainPanel(
          # Include output elements, such as control charts and visualizations
          plotOutput("control_chart"),

          textOutput("selected_var"),
          # Other visualizations and summary statistics
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  # Code to generate control charts and other visualizations

  output$control_chart <- renderPlot({

    # Generate control chart plot
    # Example: X-bar and R chart
    q1<-qcc(dataset_l[1:input$data_points,], type = "xbar")
    meanDataset <- q1$center

    })

  output$selected_var <- renderText({
    paste("La moyenne des données est : ", meanDataset)

  })

}

# Run the application
shinyApp(ui , server)
