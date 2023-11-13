library(shiny)
library(ggplot2)
library(dplyr)

# Define UI for application
ui <- fluidPage(
  titlePanel("Bottle Error Tracking"),
  sidebarLayout(
    sidebarPanel(
      img(src = "figBottle.png", height = 300, width = 300), # Add your bottle image here
      checkboxGroupInput("errors", "Select Errors:",
                         choices = c("Cap", "Label 1", "Label 2", "Other")),
      actionButton("submit", "Submit")
    ),
    mainPanel(
      plotOutput("error_plot")
    )
  )
)

# Define server logic
server <- function(input, output) {

  # Data storage
  error_data <- reactiveVal(data.frame(Bottle = numeric(0), Cap = numeric(0),
                                       Label1 = numeric(0), Label2 = numeric(0), Other = numeric(0)))

  observeEvent(input$submit, {
    # Update error_data
    new_entry <- data.frame(Bottle = nrow(error_data()) + 1,
                            Cap = as.numeric("Cap" %in% input$errors),
                            Label1 = as.numeric("Label 1" %in% input$errors),
                            Label2 = as.numeric("Label 2" %in% input$errors),
                            Other = as.numeric("Other" %in% input$errors))
    error_data(rbind(error_data(), new_entry))

    # Update plot
    output$error_plot <- renderPlot({
      error_plot_data <- error_data() %>%
        gather(key = "ErrorType", value = "Count", -Bottle) %>%
        ggplot(aes(x = Bottle, y = Count, fill = ErrorType)) +
        geom_bar(stat = "identity", position = "dodge") +
        labs(title = "Error Evolution Over Time",
             x = "Bottle Number",
             y = "Error Count") +
        theme_minimal()
      print(error_plot_data)
    })
  })
}

# Run the application
shinyApp(ui = ui, server = server)

