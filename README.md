# Tumor Data Explorer
### By Greg N - STAT 545B UBC
## Description and Purpose
This Shiny app explores the cancer_sample dataset from the datateachr package and allows users to visualize relationships between different variables in the dataset through an interactive scatter plot and provides a downloadable data table. After the latest updates made to the app for STAT545B assignment B4, the app now offers more features and a user friendly experience!

The purpose of the app is to allow users the opportunity to explore different physical characterisitics of malignant and benign tumors. By providing a tool for easy visualiztion, the hope is for users to utilize and build from this knoweldge to assist in future work and research. Ultimately, the goal is to find physical predictors of tumors for fast and efficient cancer diagnosis.

## UPDATED CURENT FEATURES (for Assignment B4)
- Scatter Plot Visualization:
      - Interactive scatter plots with customizable x and y variables using the plotly package.
      - Hover over points to see detailed information, including diagnosis and variable values.
      - Choose dot colors and adjust point sizes for better visualization.
- Data Table:
      - View the filtered dataset in a tabular format.
      - Sort and search within the table for specific entries.
- Summary Statistics:
      - Display summary statistics for the selected variables.
      - Easily accessible in the “Visualization and Summary” tab.
- Download Options:
      - Download the filtered data as a CSV file.
      - Save the current scatter plot as a PNG image.

## Features from Assignment B3
- Interactive scatter plot with selectable x and y variables
- Adjustable point size with the option to color points by cancer diagnosis
- Data table display with the option to filter and sort order 
- Download button for filtered data

## Web link to the Updated Tumor Data Explorer (Assignment B4)
[https://gnikas01.shinyapps.io/Tumor-Data-Explorer-Assignment-B4/]((https://gnikas01.shinyapps.io/Tumor-Data-Explorer-Assignment-B4/))

## Web link to Tumor Data Explorer (Old Assignment B3)
[https://gnikas01.shinyapps.io/AppDev/](https://gnikas01.shinyapps.io/AppDev/)

## How to run the app locally
1. Ensure you have R and RStudio installed on your computer.
2. Install the required packages: shiny, tidyverse, DT, plotly, and datateachr.
3. Open the app.R file in RStudio.
4. Click the "Run App" button in RStudio or run `shiny::runApp()` in the console.

## Data Source
The cancer_sample dataset is from the datateachr package, which contains data for educational purposes at the University of British Columbia. The dataset is originally from the Wisconsin Diagnostic Breast Cancer (WDBC) dataset available at the UCI Machine Learning Repository.
