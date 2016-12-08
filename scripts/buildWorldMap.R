library(dplyr)
library(stringr)
library(plotly)

buildWorldMap <- function(data, sex = "", year = "", level = "", field = "") {
  # Filters selected rows
  world.data <- data %>%
    filter(Year == year, 
           Sex == sex, 
           Level.of.education == level, 
           Field == field)
  
  # light grey boundaries
  l <- list(color = toRGB("grey"), width = 1)
  
  # specify map projection/options
  g <- list(
    showframe = FALSE,
    showcoastlines = TRUE,
    projection = list(type = 'Mercator')
  )
  
  #Plot world map. 
  worldMap <- plot_geo(world.data) %>%
    add_trace( 
      z = eval(parse(text = ~Value)), color = eval(parse(text = ~Value)), colors = 'Blues',
      text = ~Country, locations = ~Code, marker = list(line = l)
    ) %>%
    colorbar(title = 'Percentage') %>%
    layout(
      title = paste0('<br />Comparing ', level, ' <br /> Education in ', field, '<br /> among ', sex, "(", year,")"),
      geo = g,
      height = 600,
      width = 800
    )
  return(worldMap)
}