library(dplyr)
library(plotly)

df <- read.csv('OECD_stats.csv')

data <- df %>%
  select(Country., Sex, Field, Year., Value, Level.of.education) %>%
  filter(Year. == 2014) %>%
  filter(Field == "Science, mathematics and computing") %>%
  filter(Sex == "Women") %>%
  filter(Level.of.education == "Total tertiary education (ISCED2011 levels 5 to 8)") %>%
  filter(Country. != "Belgium") %>%
  filter(Country. != "China (People's Republic of)") %>%
  filter(Country. != "Israel") %>%
  filter(Country. != "South Africa")



# light grey boundaries
l <- list(color = toRGB("grey"), width = 0.5)

# specify map projection/options
g <- list(
  showframe = FALSE,
  showcoastlines = FALSE,
  projection = list(type = 'Mercator')
)

p <- plot_geo(data) %>%
  add_trace(
    z = ~Value, color = ~Value, colors = 'Blues',
    text = ~Country., locations = ~Country., marker = list(line = l)
  ) %>%
  #colorbar(title = 'GDP Billions US$', tickprefix = '$') %>%
  layout(
    title = '2014 >',
    geo = g
  )