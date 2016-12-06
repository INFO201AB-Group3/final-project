#install.packages('modelr')
#install.packages("tidyverse")
#install.packages('mass')
install.packages("alluvial")

library(dplyr)

library(tidyr)
library(modelr)
library(tidyverse)

library(MASS)

library(alluvial)

#setwd('~/Documents/INFO-201/final-project')

stats <- read.csv('data/OECD_stats.csv', stringsAsFactors = FALSE)

stats <- na.omit(stats)

#filters data frame by one varible.  
#accepts dataframe, column name, value in column
#returns filtered dataframe
filter.one <- function(my.df, var.me, my.filter){  
  my.filter <- paste(var.me, "==", my.filter)
  filtered <- my.df %>% filter_(my.filter)             
  return(filtered)                                                       
}  

#different ways of filtering the df

just.year <- filter.one(stats, 'Year.', "'2013'")

just.women <- filter.one(stats, 'Sex', "'Women'")

just.canada <- filter.one(stats, 'Country.', "'Canada'")

just.average <- filter.one(stats, 'Country.', "'OECD - Average'")

just.science <- filter.one(stats, 'Field', "'Science, mathematics and computing'")

just.level <- filter.one(stats, 'Level.of.education', "'Short-cycle tertiary education (ISCED2011 level 5)'")


#aggregates data (many to many)

sexfieldlevelyear <- aggregate( Value ~  Sex + Year. + Level.of.education + Field, data=stats, sum)

sfl.2013 <- aggregate( Value ~  Year. + Sex + Level.of.education + Field, data=just.year, sum)

sfl.wom <- aggregate( Value ~  Sex + Year. + Level.of.education + Field, data=just.women, sum)

sfl.can <- aggregate( Value ~  Sex + Year. + Level.of.education + Field, data=just.canada, sum)

sfl.avg <- aggregate( Value ~ Year. + Sex + Level.of.education + Field, data=just.average, sum)

sfl.sci <- aggregate( Value ~ Field + Sex + Level.of.education + Year., data=just.science, sum)

sfl.level <- aggregate( Value ~ Level.of.education + Sex  +  Field +  Year., data=just.level, sum)


#creates alluvial graph (variety of parallel coordinates plot)  https://www.r-bloggers.com/alluvial-diagrams/ https://cran.r-project.org/web/packages/alluvial/index.html 

alluvial(sexfieldlevelyear[,1:4], freq=sexfieldlevelyear$Value, alpha=0.8, border= 'black', col= ifelse(sexfieldlevelyear$Sex == 'Women', 'red', 'blue'))

alluvial(sfl.2013[,1:4], freq=sfl.2013$Value, alpha=0.8, border= NA, col= ifelse(sfl.2013$Sex == 'Women', 'red', 'blue'))

alluvial(sfl.wom[,1:4], freq=sfl.wom$Value, alpha=0.8, border= NA, col= ifelse(sfl.wom$Sex == 'Women', 'blue', 'red'))

alluvial(sfl.can[,1:4], freq=sfl.can$Value, alpha=0.8, border= NA, col= ifelse(sfl.can$Sex == 'Women', 'red', 'orange'))

alluvial(sfl.avg[,1:4], freq=sfl.avg$Value, alpha=0.8, border= NA, col= ifelse(sfl.avg$Sex == 'Women', 'purple', 'blue'))

alluvial(sfl.sci[,1:4], freq=sfl.sci$Value, alpha=0.8, border= NA, col= ifelse(sfl.sci$Sex == 'Women', 'purple', 'orange'))

alluvial(sfl.level[,1:4], freq=sfl.level$Value, alpha=0.8, border= NA, col= ifelse(sfl.level$Sex == 'Women', 'green', 'yellow'))



#------------------------ notes.  old code...  ignore for now-------------------




alluvial(sexfieldlevel[,1:3], freq=sexfieldlevel$Value, alpha=0.8, border= 'black', col='blue')

alluvial(sexfieldlevel.avg[,1:3], freq=sexfieldlevel.avg$Value, alpha=0.8, border= 'black', col= ifelse(sexfieldlevel.avg$Sex == 'Women', 'red', 'blue'))


sexfield.avg <- aggregate( Value ~ Sex + Field, data=just.average, sum)
sexfield.g20 <- aggregate( Value ~ Sex + Field, data=just.g20, sum)


sexfield2.avg <- aggregate( Value ~ Sex + Field, data=just.average, sum)
sexfield2.g20 <- aggregate( Value ~ Sex + Field, data=just.g20, sum)

sexfieldlevel <- aggregate( Value ~ Sex + Field + Level.of.education , data=stats, sum)

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

slt.country.year.sex.value <- select.four(data, 'Country.', 'Year.', 'Sex', 'Value')

slt.country.year.sex.field <- select.four(stats, 'Country.', 'Year.', 'Sex', 'Field')

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

bysexonly <- stats%>%
  filter(Sex == 'Women')

just.year <- filter.one(stats, 'Year.', "'2013'")

just.women4 <- filter.one(stats, 'Sex', "'Women'")

just.science.women <- filter.one(just.women4, 'Country.', "'Canada'")

just.average <- filter.one(stats, 'Country.', "'OECD - Average'")
just.g20 <- filter.one(stats, 'Country.', "'G20'")

just.science <- filter.one(stats, 'Field', "'Science, mathematics and computing'")
just.canada <- filter.one(just.science, 'Country.', "'Canada'")



ggplot(data = data)+
  geom_bar( 
    mapping = aes(x = Value, y = Level.of.education, fill = Sex), position = 'fill', stat = "identity")

ggplot(df, aes(trt, outcome)) +
  geom_bar(stat = "identity")

ggplot(data = data) +
  geom_smooth(mapping = aes(x = Value, y = Year., color = Level.of.education))+
  geom_line(mapping = aes(x = Value, y = Year., color = Level.of.education))

ggplot(data = data) +
  geom_smooth(mapping = aes(x = Level.of.education, y = Value, color = Year.))+
  geom_point(mapping = aes(x = Level.of.education, y = Value, color = Year.))





#nesting

data <- na.omit(stats) 

slt.country.year.sex.value[!complete.cases(slt.country.year.sex.value),]




nested.by.country.value <- slt.country.year.sex.value%>%
  group_by(Country.)%>%
  nest()


country_model <- function(df) {
  lm(Value ~ Year., data = df)
}

models <- map(nested.by.country.value$data, country_model)


values.df <- unnest(nested.by.country.value, Value)







slt.country.year.sex.value %>% 
  ggplot(aes(Year., Value)) +
  geom_line(aes(group = Country.), alpha = 1 / 3) + 
  geom_smooth(se = FALSE)
#> `geom_smooth()` using method = 'gam'

