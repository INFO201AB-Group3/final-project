
library(shiny)
library(dplyr)
library(alluvial)
library(ggplot2)

buildAlluvial <- function(data, sex = "", year = "", level = "", field = ""){
  
  data <- na.omit(data)
  data <- data %>% filter(Country != 'G20', 
                            Country != 'OECD - Average',
                            Level.of.education != 'Total tertiary')
  
  my.filter1 <- paste0('Sex', " == '", sex, "'")
  my.filter2 <- paste0('Year', " == '", year, "'")
  my.filter3 <- paste0('Level.of.education', " == '", level, "'")
  my.filter4 <- paste0('Field', " == '", field, "'")


  filtered <- my.df %>% filter_(my.filter1,
                                my.filter2,
                                my.filter3,
                                my.filter4)
  
  # filtered <- data %>% filter(Sex == sex, 
  #                               Year == year, 
  #                               Level.of.education == level, 
  #                               Field == field) 
  
    
        
      df.agg <- aggregate( Value ~ Sex + Year + Level.of.education + Field, data=filtered, sum)
      plots <- alluvial(df.agg[,1:4], freq=df.agg$Value, xw=0.1, alpha=0.6, gap.width = 0.1, border= 'black', col= ifelse(df.agg$Sex == 'Women', 'red', 'blue'))
      return(plots) 
  }  