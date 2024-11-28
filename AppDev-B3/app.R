# This is a Shiny web application for exploring tumor data from the cancer_sample from datateachr package. 

library(shiny)
library(tidyverse)
library(datateachr)

# Load the data
data(cancer_sample)

# UI
ui <- fluidPage(
  titlePanel("Tumor Data Explorer"),
  sidebarLayout(
    sidebarPanel(
      selectInput("x_var", "X-axis variable:", 
                  choices = names(cancer_sample)[sapply(cancer_sample, is.numeric)],
                  selected = "radius_mean"),
      selectInput("y_var", "Y-axis variable:", 
                  choices = names(cancer_sample)[sapply(cancer_sample, is.numeric)],
                  selected = "area_mean"),
      selectInput("color_var", "Color by:", 
                  choices = c("None", "diagnosis"),
                  selected = "None"),
      sliderInput("point_size", "Point size:", 
                  min = 1, max = 5, value = 2, step = 0.5),
      downloadButton("download_data", "Download Filtered Data")
    ),
    
    mainPanel(
      plotOutput("scatter_plot"),
      br(),
      dataTableOutput("data_table")
    )
  )
)

# Server
server <- function(input, output) {
  
  # Reactive filtered dataset
  filtered_data <- reactive({
    cancer_sample
  })
  
  # Scatter plot
  output$scatter_plot <- renderPlot({
    p <- ggplot(filtered_data(), aes_string(x = input$x_var, y = input$y_var)) +
      geom_point(size = input$point_size)
    
    if (input$color_var != "None") {
      p <- p + aes_string(color = input$color_var)
    }
    
    p + theme_minimal() +
      labs(title = paste(input$y_var, "vs", input$x_var),
           x = input$x_var,
           y = input$y_var)
  })
  
  # Data table
  output$data_table <- renderDataTable({
    filtered_data()
  })
  
  # Download handler
  output$download_data <- downloadHandler(
    filename = function() {
      paste("cancer_sample_filtered_", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(filtered_data(), file, row.names = FALSE)
    }
  )
}

# Run the app
shinyApp(ui = ui, server = server)
