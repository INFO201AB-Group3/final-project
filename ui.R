# Final Project
# ui.R



library(shiny)
library(shinythemes)
library(plotly)
library(DT)
library(markdown)

# Shiny ui
# Multi-page layout
shinyUI(navbarPage("Analysis of Graduates by Field", theme = shinytheme("superhero"),
                   # tabPanel shows horizontal bar chart comparing countries based on user inputs
                   tabPanel('Country Comparison',
                   titlePanel("Comparing Degrees Awarded In Different Countries"),
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
                                                 "Doctoral" = "Doctoral", 
                                                 "All" = "Total tertiary"), 
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
                  
                    # Displays horizontal bar chart              
                    mainPanel(
                      plotlyOutput('hbar')
                    )
                  )
                ),
                
                # tabPanel to show line charts of field trends by country
                tabPanel('Field Comparison',
                  titlePanel('Analyzing Field Trends By Country'),
                    sidebarLayout(
                      sidebarPanel(
                        textInput('country', label=h3("Find a Country"), value = 'United States'),
                        
                        # Sex dropdown widget
                        selectInput("sex1", label = h3("Gender"), 
                                    choices = list("Women" = "Women", 
                                                   "Men" = "Men"), 
                                    selected = "Women"),
                             
                        # Education level dropdown widget
                        selectInput("level1", label = h3("Education Level"), 
                                    choices = list("2-Year College" = "2-year college",
                                                  "Bachelors" = "Bachelor's",
                                                  "Masters" = "Master's",
                                                  "Doctoral" = "Doctoral", 
                                                  "All" = "Total tertiary"), 
                                    selected = "Bachelor's"),
                        hr(),
                        helpText("Data from the Organisation for Economic Co-operation and Development (OECD)")
                             
                      ),
                           
                      # Displays the line charts
                      mainPanel(
                      plotOutput('line')
                      )
                    )
                ),
                
                # Tabs with data and background information
                navbarMenu("More Information",
                           # Show the data set
                           tabPanel("Data",
                                    DT::dataTableOutput("table")
                           ),
                           
                           # Gives background information on data
                           tabPanel("Background Information",
                                    includeMarkdown("data_info.md"))
                )
                  
))                   
