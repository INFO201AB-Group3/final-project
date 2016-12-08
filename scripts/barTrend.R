library(dplyr)
library(plotly)

#data.Trend <- read.csv('OECD_stats.csv')

barTrend <- function(data.trend) {

#rid of all the N/A's  
Map.Stats <- na.omit(data)

# Narrowing down without USA Values 
Rest.of.World <- Map.Stats %>% 
  select(Country., Value, Sex, Field, Year., Level.of.education) %>%
  filter(Country. != "United States")  %>%
  filter(Level.of.education == "Total tertiary") %>%
  filter(Field == 'Engineering, manufacturing and construction') %>%
  filter(Sex == 'Women')

#Narrowing down with just USA Values 
USA <- Map.Stats %>%
  select(Country., Value, Sex, Field, Year., Level.of.education) %>%
  filter(Country. == "United States") %>%
  filter(Level.of.education == 'Total tertiary') %>%
  filter(Field == 'Engineering, manufacturing and construction') %>%
  filter(Sex == 'Women')

#Summary of only USA Values and year
USA.stat <- function(USA, Year) {
            USA %>%
            select(Year., Value)
}

#Calling the function 
Avarage.all.USA <- USA.stat(USA, YEAR)


#finding the summary for each year for the rest of the World
Rest.of.World.Function <- function(Rest.of.World, Year)  {
  Rest.of.World %>%
  select(Year., Value) %>%
  group_by(Year.) %>%
  summarise(mean(Value))
} 

#Calling the Function 
Average.all.ROW <- Rest.of.World.Function(Rest.of.World, Year)


#create two Different Vectors using the summary 
Y1 <- c(Average.all.ROW)
Y2 <- c(Avarage.all.USA)

#create new dataframe using the Vector Y1and Y2
New.DataFrame <- data.frame(Y1,Y2)

#building the graph camparing women engineering degree in the USA to the rest of the world 
Bargraph <- plot_ly(New.DataFrame, x = ~Year. , y = ~Value  , type = 'bar', name = 'USA',
             marker = list(color = 'rgb(55, 83, 109)')) %>%
  
  add_trace(y= ~mean.Value., name = 'Rest of the World', marker = list(color = 'rgb(26, 118, 255)')) %>%
  
  layout(title = 'Comparison Of Women Engineering Degree In The USA To <br> The Rest Of The World"',
         xaxis = list(
           title = "",
           tickfont = list(
             size = 14,
             color = 'rgb(107, 107, 107)')),
         yaxis = list(
           title = 'Percent',
           titlefont = list(
             size = 16,
             color = 'rgb(107, 107, 107)'),
           tickfont = list(
             size = 14,
             color = 'rgb(107, 107, 107)')),
         legend = list(x = 0, y = 1, bgcolor = 'rgba(255, 255, 255, 0)', bordercolor = 'rgba(255, 255, 255, 0)'),
         barmode = 'group', bargap = 0.15, bargroupgap = 0.1) 
}  

