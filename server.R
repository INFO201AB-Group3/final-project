# Final Project
# server.R

library(dplyr)
library(ggplot2)
library(data.table)
library(DT)

# Source files for functions
source('./scripts/buildBar.R')
source('./scripts/buildLine.R')

# Read in OECD data
my.df <- read.csv(file = "./data/OECD_stats.csv")
# Select desired columns
my.df <- my.df %>%  select(Country., Sex, Field, Level.of.education, Year., Value) %>% 
  rename(Country = Country., Year = Year.)

# Start shinyServer
# Returns a bunch of charts and graphs
shinyServer(function(input, output) { 
  
  # Renders horizontal bar chart from ui.R inputs
  output$hbar <- renderPlotly({
    return(BuildBar(my.df, input$sex, input$year, input$level, input$field)) 
  })
  
  # Renders line chart from ui.R inputs
  output$line <- renderPlot({
    print(BuildLine(my.df, input$country, input$sex1, input$level1))
  })
  
  # Render data table 
  output$table <- DT::renderDataTable({
    DT::datatable(my.df, rownames = FALSE) %>% 
      formatStyle('Country',  color = 'black') %>%
      formatStyle('Field',  color = 'black') %>%
      formatStyle('Year',  color = 'black') %>%
      formatStyle('Sex',  color = 'black') %>%
      formatStyle('Level.of.education',  color = 'black') %>%
      formatStyle("Value", color = 'black')
  })
})