
library(shiny)
library(dplyr)
library(alluvial)
library(ggplot2)

# this renders the plot and outputs a alluvial plot

# Source files for functions
source('./scripts/buildAlluvial.R')

# Read in OECD data
my.df <- read.csv(file = "./data/OECD_stats.csv")
# Select desired columns
my.df <- my.df %>%  select(Country., Sex, Field, Level.of.education, Year., Value) %>% 
  rename(Country = Country., Year = Year.)
###############################################################################
my.df <- na.omit(my.df)

# my.df <- my.df %>% filter(Country != 'G20', 
#                           Country != 'OECD - Average',
#                           Level.of.education != 'Total tertiary')

# my.filter1 <- paste0('Sex', " == '", sex, "'")
# my.filter2 <- paste0('Year', " == '", year, "'")
# my.filter3 <- paste0('Level.of.education', " == '", level, "'")
# my.filter4 <- paste0('Field', " == '", field, "'")

# filtered <- my.df %>% filter_(Sex == sex,
#                               Year == year,
#                               Level.of.education == level,
#                               Field == field) 
###############################################################################
# Start shinyServer
# Returns a bunch of charts and graphs input$filter1, input$filter2,

shinyServer(function(input, output) { 
  
  output$plot <- renderPlot({ 
    return(buildAlluvial(my.df, input$sex, input$year, input$level, input$field))
   })
  
})
  


