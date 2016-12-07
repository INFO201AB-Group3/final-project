library(dplyr)
library(plotly)

df <- read.csv('OECD_stats.csv')

dataset <- na.omit(df)
  data <- dataset %>%
    select(Country., Sex, Field, Year., Value, Level.of.education) %>%
    filter(Year. == 2014) %>%
    filter(Field == "Science, mathematics and computing") %>%
    filter(Sex == "Women") %>%
    filter(Level.of.education == "Total tertiary education (ISCED2011 levels 5 to 8)") %>%
    
    
    data$Code <- c("AUS" ,"AUT", "CZE","DNK", "FIN", "FRA", "DEU", "GRC", "HUN","IRL",
                   "ITA", "JPN"," PRK", "LUX", "MEX","NLD", "NZL", "NOR", "POL","PRT",
                   "SVK", "ESP", "SWE","CHE", "TUR","GBR", "USA", "BRA", "CHL","COL",
                   "EST","IDN","LVA", "RUS", "SAU", "SVN")


# light grey boundaries
l <- list(color = toRGB("grey"), width = 1)

# specify map projection/options
g <- list(
  showframe = FALSE,
  showcoastlines = FALSE,
  projection = list(type = 'Mercator')
)

p <- plot_geo(data) %>%
  add_trace( 
    z = ~Value, color = ~Value, colors = 'Blues',
    text = ~Country., locations = ~Code, marker = list(line = l)
  ) %>%
  colorbar(title = 'Percentage') %>%
  layout(
    title = 'Comparing Total Tertiary Education Around the World in 2014',
    geo = g
  )