
#Final project, alluvial graph scrip

library(shiny)
library(dplyr)
library(alluvial)

#builds an alluvial version of a parallel sets plot
#receives Data Frame, and filters for Sex, Year, Level, Field, and Country columns
#returns plot

buildAlluvial <- function(my.df, sex, year, level, field, country){
 
  #filters outs two non-countries that were extraneous 
   my.df <- my.df %>% filter(Country != 'G20', 
                            Country != 'OECD - Average')
  #Filters by country, if one is entered
  if (country != ""){
    my.df <- my.df %>% filter(Country == country)}                   
  
   #Subsets dataframe using the filters.  I tried to dplyr this, and it broke. Since everythings else I touched today
   #broke when I tried to go to the next step, I'm leaving it
   sexs <- subset(my.df, Sex %in% sex)
   years <- subset(sexs, Year %in% year)
   levels <- subset(years, Level.of.education %in% level)
   filtered <- subset(levels, Field %in% field)
  
    #aggregates (many to many) the filtered data
    df.agg <- aggregate( Value ~  Sex + Year + Level.of.education + Field, data=filtered, sum)
    #builds the plot.    
    plots <- alluvial(df.agg[,1:4], freq=df.agg$Value, 
                      xw=0.15, alpha=0.6, gap.width = 0.09, 
                      border= ifelse(df.agg$Sex == 'Women', 'darkgreen', 'mediumslateblue'), 
                      col= ifelse(df.agg$Sex == 'Women', 'green4', 'slateblue'))
    return(plots) 
  }
