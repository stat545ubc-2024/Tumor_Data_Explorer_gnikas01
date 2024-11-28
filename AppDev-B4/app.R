# Load required libraries
library(shiny)
library(tidyverse)
library(plotly)
library(DT)
library(datateachr)

# Define custom CSS for styling
custom_css <- "
  body { background-color: #FFEFD5; }
  .summary-stats { 
    font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
    font-size: 16px;
    color: #8B4513;
    background-color: #FFF5E6;
    padding: 15px;
    border-radius: 5px;
    margin-top: 20px;
  }
"

# Define the user interface
ui <- fluidPage(
  tags$head(
    tags$style(HTML(custom_css))
  ),
  
  titlePanel("Tumor Data Explorer"),
  
  p("This app allows users to explore and visualize physical characterisitics of patient tumor data.
    You can create scatter plots, view data tables, and generate summary statistics 
    based on selected variables and filters. You are encourage to explore the relationship between all the different varaibles,
    and generate interesting plots that you can download."),
  
  p("The cancer_sample dataset is from the datateachr package, 
  which contains data for educational purposes at the University of British Columbia. 
  The dataset is originally from the Wisconsin Diagnostic Breast Cancer (WDBC) dataset available at the UCI Machine Learning Repository.
    For more information, visit: ",
    a("https://github.com/UBC-MDS/datateachr", 
      href="https://github.com/UBC-MDS/datateachr", 
      target="_blank")),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select variables to explore Tumor Data"),
      
      selectInput("x_var", "X-axis variable:", 
                  choices = names(cancer_sample), 
                  selected = "radius_mean"),
      
      selectInput("y_var", "Y-axis variable:", 
                  choices = names(cancer_sample), 
                  selected = "texture_mean"),
      
      sliderInput("point_size", "Point Size:",
                  min = 1, max = 5, value = 2, step = 0.5),
      
      checkboxGroupInput("diagnosis", "Filter by Diagnosis:",
                         choices = unique(cancer_sample$diagnosis),
                         selected = unique(cancer_sample$diagnosis))
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Visualization and Summary", 
                 plotlyOutput("scatter_plot"),
                 div(class = "summary-stats", 
                     h4("Summary Statistics"),
                     verbatimTextOutput("summary_stats")),
                 downloadButton("download_data", "Download Filtered Data"),
                 downloadButton("download_plot", "Download Plot")),
        tabPanel("Data Table", 
                 DTOutput("data_table"))
      )
    )
  )
)

# Define the server logic
server <- function(input, output, session) {
  
  filtered_data <- reactive({
    cancer_sample %>%
      filter(diagnosis %in% input$diagnosis)
  })
  
  plot_data <- reactive({
    ggplot(filtered_data(), aes_string(x = input$x_var, y = input$y_var, color = "diagnosis")) +
      geom_point(size = input$point_size) +
      scale_color_manual(values = c("B" = "darkblue", "M" = "darkred")) +
      theme_minimal() +
      labs(title = paste("Scatter plot of", input$y_var, "vs", input$x_var),
           x = input$x_var, y = input$y_var)
  })
  
  output$scatter_plot <- renderPlotly({
    ggplotly(plot_data())
  })
  
  output$data_table <- renderDT({
    datatable(filtered_data(), options = list(pageLength = 10))
  })
  
  output$summary_stats <- renderPrint({
    summary(filtered_data()[, c(input$x_var, input$y_var)])
  })
  
  output$download_data <- downloadHandler(
    filename = function() {
      paste("filtered_cancer_data_", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(filtered_data(), file, row.names = FALSE)
    }
  )
  
  output$download_plot <- downloadHandler(
    filename = function() {
      paste("cancer_plot_", Sys.Date(), ".png", sep = "")
    },
    content = function(file) {
      ggsave(file, plot = plot_data(), device = "png", width = 10, height = 6)
    }
  )
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
