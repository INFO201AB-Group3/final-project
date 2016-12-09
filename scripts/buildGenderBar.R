library(plotly)


#Breaks down the data to just Tertiary education among women in 2014
buildGenderBar <- function(dataset, country) {
  dataset <- na.omit(data)
  data <- dataset %>%
    filter(Year == 2014) %>%
    filter(Field == "Science, mathematics and computing") %>%
    filter(Country == country) %>%
    filter(Level.of.education == "Total tertiary")
  
  x <- c('Women', 'Men')
  y <- c(dataFromCountry[1,6], dataFromCountry[2,6])
  
  #Plot graph
  data$x <- factor(data$x, levels = data[["x"]])
  
  p <- plot_ly(dataFromCountry, x = ~x, y = ~y, type = 'bar', color = ~x, name = 'Primary Product') %>%
    layout(title = "Comparison Between Women and Men",
           xaxis = list(title = "Gender", tickangle = -45),
           yaxis = list(title = "Percentage"),
           margin = list(b = 100),
           barmode = 'group')
  
}

#test
#dataFromCountry <- buildGenderBar(dataset, "Australia")

