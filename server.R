# Final Project
# server.R

library(dplyr)
library(ggplot2)
library(data.table)
library(DT)
library(alluvial)

# Source files for functions
source('./scripts/buildBar.R')
source('./scripts/buildLine.R')
source('./scripts/buildWorldMap.R')
source('./scripts/barTrend.R')
source('./scripts/buildAlluvial.R')

# Read in OECD data
my.df <- read.csv(file = "./data/OECD_stats.csv")
# Dataframe with country codes for map function
code.df <- read.csv(file = "./data/OECD_stats_CODE.csv") 
# Select desired columns
my.df <- my.df %>%  select(Country., Sex, Field, Level.of.education, Year., Value) %>% 
  rename(Country = Country., Year = Year.)
code.df <- code.df %>% select(COUNTRY, Country., Sex, Field, Level.of.education, Year., Value) %>% 
  rename(Code = COUNTRY, Country = Country., Year = Year.)
# Remove NA rows
my.df <- na.omit(my.df)
code.df <- na.omit(code.df)

# Start shinyServer
# Returns a bunch of charts and graphs
shinyServer(function(input, output) { 
  # Renders alluvial chart from inputs
  output$plot <- renderPlot({ 
    return(buildAlluvial(my.df, input$sex3, input$year3, input$level3, input$field3, input$country3))
  })
  # Renders horizontal bar chart from ui.R inputs
  output$hbar <- renderPlotly({
    return(BuildBar(my.df, input$sex, input$year, input$level, input$field)) 
  })
  
  # Renders line chart from ui.R inputs
  output$line <- renderPlot({
    print(BuildLine(my.df, input$country1, input$sex1, input$level1))
  })
  
  # Renders the world map comparison
  output$worldMap <- renderPlotly({
    return(buildWorldMap(code.df, input$sex2, input$year2, input$level2, input$field2))  
  })
  
  #Renders the bar graph comparing rest of the world with the US. (BETTY)
  output$BarGraph  <- renderPlotly({
    return(barTrend(my.df))
  })
  
  # Render data table 
  output$table <- DT::renderDataTable({
    DT::datatable(my.df, rownames = FALSE) %>% 
      formatStyle('Country',  color = 'black') %>%
      formatStyle('Field',  color = 'black') %>%
      formatStyle('Year',  color = 'black') %>%
      formatStyle('Sex',  color = 'black') %>%
      formatStyle('Level.of.education',  color = 'black') %>%
      formatStyle('Value', color = 'black')
  })
})