library(plotly)

df <- read.csv('OECD_stats.csv')
dataset <- na.omit(df)

data <- dataset %>%
  select(Country., Sex, Field, Year., Value, Level.of.education) %>%
  filter(Year. == 2014) %>%
  filter(Field == "Science, mathematics and computing") %>%
  filter(Level.of.education == "Total tertiary education (ISCED2011 levels 5 to 8)")
  


x <- c('Feature A', 'Feature B', 'Feature C', 'Feature D', 'Feature E')
y <- c(20, 14, 23, 25, 22)
data <- data.frame(x, y)

p <- plot_ly(data, x = ~x, y = ~y, type = 'bar', color = I("black")) %>%
  layout(title = "Features",
         xaxis = list(title = ""),
         yaxis = list(title = ""))