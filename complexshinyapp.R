library(shiny)
library(shinydashboard)
library(ggplot2)

# Define UI
ui <- dashboardPage(
  dashboardHeader(title = "Complex Shiny App"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Tab 1", tabName = "tab1", icon = icon("dashboard")),
      menuItem("Tab 2", tabName = "tab2", icon = icon("bar-chart-o"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "tab1",
              fluidRow(
                box(plotOutput("plot1", height = 250)),
                box(title = "Controls",
                    sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              )
      ),
      tabItem(tabName = "tab2",
              h2("Tab content 2")
      )
    )
  )
)

# Define server logic
server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)

  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

# Run the application
shinyApp(ui = ui, server = server)

