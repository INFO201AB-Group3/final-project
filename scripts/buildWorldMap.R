library(dplyr)
library(plotly)

#Test
#data <- read.csv(file = "./data/OECD_stats.csv")
#data <- data %>%  select(Country., Sex, Field, Level.of.education, Year., Value) %>% 
#rename(Country = Country., Year = Year.)


buildWorldMap <- function(data) {
  #Gets rid of all the N/A's 
  dataset <- na.omit(data)
  
  #Breaks down the data to just Tertiary education among women in 2014
  data <- dataset %>%
      select(Country, Sex, Field, Year, Value, Level.of.education) %>%
      filter(Year == 2014) %>%
      filter(Field == "Science, mathematics and computing") %>%
      filter(Sex == "Women") %>%
      filter(Level.of.education == "Total tertiary")
  #Adds a column of abbreviations for each country. 
  data$Code <- c("AUS" ,"AUT", "CZE","DNK", "FIN", "FRA", "DEU", "GRC", "HUN","IRL",
                     "ITA", "JPN"," PRK", "LUX", "MEX","NLD", "NZL", "NOR", "POL","PRT",
                     "SVK", "ESP", "SWE","CHE", "TUR","GBR", "USA", "BRA", "CHL","COL",
                     "EST","IDN","LVA", "RUS", "SAU", "SVN")
  
  # light grey boundaries
  l <- list(color = toRGB("grey"), width = 1)
  
  # specify map projection/options
  g <- list(
    showframe = FALSE,
    showcoastlines = TRUE,
    projection = list(type = 'Mercator')
  )
  
  #Plot world map. 
  worldMap <- plot_geo(data) %>%
    add_trace( 
      z = ~Value, color = ~Value, colors = 'Blues',
      text = ~Country, locations = ~Code, marker = list(line = l)
    ) %>%
    colorbar(title = 'Percentage') %>%
    layout(
      title = '<br /> Comparing Total Tertiary Education <br /> Around the World in 2014',
      geo = g
    )
}