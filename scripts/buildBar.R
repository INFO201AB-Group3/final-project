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
  
  # Makes a dataframe of just OECD Averages, gathered in 2013
  averages.data <- data %>% filter(Sex == sex, 
                                   Country == "OECD - Average",
                                   Year == "2013",
                                   Level.of.education == level, 
                                   Field == field)
  
  # Average value for "level" and "field"
  average <- averages.data$Value[1] 
  
  # Removes "OECD - Average" from data
  country.data <- data %>%filter(Country != "OECD - Average") 
  
  # Filter rows from inputs
  country.data <- country.data %>% 
    filter(Sex == sex, Year == year, Level.of.education == level, Field == field) %>%
    arrange(-Value)
  
  # Remove rows with n/a in Values column
  country.data <- na.omit(country.data)
  
  plot_ly(country.data, x = eval(parse(text = x.equation)), 
          y = eval(parse(text = y.equation)), 
          type = 'bar', orientation = 'h',
          marker = list(color = "#2451C1"),
          name = "") %>%
    add_trace(y = "OECD - Average", x = average, 
              name = "Average", 
              marker = list(color = "#FC9201")) %>% 
    
    layout(title = .simpleCap(paste0(level, " degrees awarded to ", sex, " in <br />", field, " (", year, ")")), 
           xaxis = list(range = c(0, 100), title = "Percent"),
           yaxis = list(title ="",  showticklabels = TRUE),
           margin = list(l = 100, t = 100),
           autosize = F, 
           width = 750, 
           height = 800,
           showlegend = FALSE)
}