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
    ggtitle(.simpleCap(paste0(level, " degrees awarded to ", sex, " by field"))) +
    theme(plot.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=18, hjust=0), 
          axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=12),
          strip.text.x = element_text(family = "Trebuchet MS", size = 16),
          legend.text=element_text(size=14))
  return(field.trend)
}