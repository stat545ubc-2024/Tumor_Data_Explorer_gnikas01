# Tumor Data Explorer
This Shiny app explores the cancer_sample dataset from the datateachr package and allows users to visualize relationships between different variables in the dataset through an interactive scatter plot and provides a downloadable data table.

## Features
- Interactive scatter plot with selectable x and y variables
      - This feature allows for full customization of the scatter plot allowing the user to explore all different relationships between the variables in cancer_sample
- Adjustable point size with the option to color points by cancer diagnosis
      - Allows for the user to adjust the point size making the graph more accesible. Also, be coloring based on diagnosis, it allows the user easy classification of the           data points on the scatter plot.
- Data table display with the option to filter and sort order
      - Gives the user the option to easily filter and sort the data based on any variable in the dataset   
- Download button for filtered data
      - Easy option to download .csv file of the filtered data for further exploration on the user's local computer.

## Web link to Tumor Data Explorer
[https://gnikas01.shinyapps.io/AppDev/](https://gnikas01.shinyapps.io/AppDev/)

## How to run the app locally
1. Ensure you have R and RStudio installed on your computer.
2. Install the required packages: shiny, tidyverse, and datateachr.
3. Open the app.R file in RStudio.
4. Click the "Run App" button in RStudio or run `shiny::runApp()` in the console.

## Data Source
The cancer_sample dataset is from the datateachr package, which contains data for educational purposes at the University of British Columbia. The dataset is originally from the Wisconsin Diagnostic Breast Cancer (WDBC) dataset available at the UCI Machine Learning Repository.
