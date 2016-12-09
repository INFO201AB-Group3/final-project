#install.packages("shinythemes")
#install.packages("alluvial")

library(shiny)
library(dplyr)
#library(tidyr)
#library(modelr)
#library(tidyverse)
#library(MASS)
library(shinythemes)
library(plotly)
#library(DT)
#library(markdown)
library(alluvial)

shinyUI(navbarPage("Analysis of Graduates by Field", theme = shinytheme("superhero"),
  tabPanel('Overall Comparison',
   titlePanel('testing graph'),
    sidebarLayout(
      sidebarPanel(
       
        # Sex dropdown widget
        selectInput("sex", label = h3("Gender"), 
                    choices = list("Women" = "Women",
                                   "Men" = "Men"), 
                    selected = "Women"),
        
        # Year dropdown widget
        selectInput("year", label = h3("Year"), 
                    choices = list("2005" = "2005",
                                   "2010" = "2010",
                                   "2011" = "2011",
                                   "2012" = "2012",
                                   "2013" = "2013",
                                   "2014" = "2014"),
                    selected = "2014"),
        
        # Education level dropdown widget
        selectInput("level", label = h3("Education Level"), 
                    choices = list("2-Year College" = "2-year college",
                                   "Bachelors" = "Bachelor's",
                                   "Masters" = "Master's",
                                   "Doctoral" = "Doctoral"), 
                    selected = "Bachelor's"),
        
        # Field dropdown widget
        selectInput("field", label = h3("Field"), 
                    choices = list("Science, Mathematics and Computing" = "Science, mathematics and computing",
                                   "Education" = "Education",
                                   "Humanities and Arts" = "Humanities and arts",
                                   "Social Sciences, Business and Law" = "Social sciences, business and law",
                                   "Engineering, Manufacturing and Construction" = "Engineering, manufacturing and construction",
                                   "Agriculture and Veterinary" = "Agriculture and veterinary",
                                   "Health and Welfare" = "Health and Welfare",
                                   "Services" = "Services"), 
                    selected = "Science, mathematics and computing"),
        hr(),
        helpText("Data from the Organisation for Economic Co-operation and Development (OECD)")
        
      ),
      
      mainPanel(
      
      plotOutput('plot', width = '100%', height = '600px')
      
    ) 
  ) 
)   
)
)
