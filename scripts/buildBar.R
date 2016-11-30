# Final Project
# Plot Function

library(plotly)
library(stringr)
library(dplyr)
library(ggplot2)
library(data.table)

# .simpleCap function included to capitalize chart titles when needed 
.simpleCap <- function(x) {
  s <- strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1, 1)), substring(s, 2),
        sep = "", collapse = " ")
}

# Function builds a horizontal bar chart
BuildBar <- function(data, sex = "", year = "", level = "", field = "", 
                     xvar = "Value", yvar = "Country") {
  
  x.equation <- paste0('~', xvar)
  y.equation <- paste0('~', yvar)
  
  data <- data %>% filter(Sex == sex, Year == year, Level.of.education == level, Field == field) 
 
  plot_ly(data, x = eval(parse(text = x.equation)), y = eval(parse(text = y.equation)), 
          type = 'bar', orientation = 'h',
          marker = list(color = yvar,
                        colors = 'reds')) %>%

    layout(title = .simpleCap(paste0(level, " <br /> degreess awarded to ", sex, " in <br />", field, " (", year, ")")), 
           xaxis = list(range = c(0, 100), title = "Percent"),
           yaxis = list(title =""),
           margin = list(l = 100, t = 100),
           height = 3000)
}

# Function builds a ggplot line chart
BuildLine <- function(data, country = "", sex = "", level = "") {
  
  data <- data %>% filter(Country == country, 
                          Sex == sex, 
                          Level.of.education == level)
  data <- na.omit(data) # Remove NA values from dataframe
  
  # Build line chart
  field.trend <- ggplot(data, aes(x=Year, y=Value, color=Field)) +
    geom_line(size=1) +
    facet_wrap(~Country, scales="free") +
    scale_x_continuous(name="Year", breaks=seq(2005,2014,1)) +
    scale_y_continuous(name="Percent", limits=c(0,100)) +
    ggtitle(.simpleCap(paste0(level, " (", sex,")"))) +
    theme(plot.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=18, hjust=0), 
      axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=12),
      strip.text.x = element_text(family = "Trebuchet MS", size = 16),
      legend.text=element_text(size=14))
  return(field.trend)
}