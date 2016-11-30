#install.packages('modelr')
#install.packages("tidyverse")


library(dplyr)

library(tidyr)
library(modelr)
library(tidyverse)


#setwd('~/Documents/INFO-201/final-project')

stats <- read.csv('data/OECD_stats.csv', stringsAsFactors = FALSE)

colnames(stats)

#this work, but doesn't give us good results.  
#i think the df needs to be simplified to at the most four variables and maybe just two

nested.by.country <- stats%>%
  group_by(Country.)%>%
  nest()

#these group by one or two columns (but you can add as many my.groups as you want to do more)
#not real useful by themselves, but can by used with other functions

group.one <- function(my.df, my.group){ 
  data <- my.df %>%
    group_by_(my.group)
    
  return(data)
} 


by.country <- group.one(stats, 'Country.')

group.two <- function(my.df, my.group1, my.group2){ 
  data <- my.df %>%
    group_by_(my.group1, my.group2)
        return(data)
} 

by.field.sex <- group.two(stats, 'Field', 'Sex')


#these select three or four columns

select.three <- function(my.df, my.select1, my.select2, my.select3){ 
  data <- my.df %>%
    select_(my.select1, my.select2, my.select3)
  return(data)
} 


slt.country.year.Value <- select.three(stats, 'Country.', 'Year.', 'Value')



select.four <- function(my.df, my.select1, my.select2, my.select3, my.select4){ 
  data <- my.df %>%
    select_(my.select1, my.select2, my.select3, my.select4)
  return(data)
} 


slt.country.year.sex.value <- select.four(stats, 'Country.', 'Year.', 'Sex', 'Field')

#filtering

bysexonly <- stats%>%
  filter(Sex == 'Women')


female.fltr <- filtered.one(stats, 'Women')

filtered.sex <- function(my.df, my.filter){ 
  data <- my.df %>%
    filter(Sex == my.filter)
  return(data)
} 



sex.filt.selc <- function(my.df, my.filter, my.select1, my.select2, my.select3){
  filtered <- filtered.sex(my.df, my.filter)
  selected <- select.four(filtered, my.select1, my.select2, 'Sex', my.select3)
  return(selected)
  
}

women.filt.selc <- sex.filt.selc(stats, 'Country.', 'Year.', 'Value')


## THESE DON'T work. I can pass in the item to be filtered by (Women) but passing in the col name causes
# it to fail.  these are things I've tried to make it work.

#filters by one or two values 

filter.one <- function(my.df, my.col, my.value, my.select1, my.select2, my.select3 ){ 
  #my.col = as.vector(my.col)
  #my.value = as.vector(my.value)
  data <- my.df %>%
    filter_(my.col = my.value)%>%
    select_(my.value, my.select1, my.select2, my.select3)
  return(data)
} 

female.fltr <- filter.one(stats, 'Sex', 'Women', 'Country.', 'Year.', 'Value')


filter.by.sex <- function(my.df, var.me, my.filter){  
  my.filter <- as.vector(paste(my.col, "==", var.me))
  filtered <- my.df %>% filter_(my.filter)             
  return(filtered)                                                       
}  

just.women4 <- filter.by.sex(stats, Sex, "Women")    
   



