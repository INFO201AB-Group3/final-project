# Final Project
# ui.R

# install.packages("DT")
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
                
                # Show trends in static visualizations to answer our specific questions
                navbarMenu("Trends",
                           # Shows a map
                           tabPanel("Global Map Visualization",
                                    titlePanel("Comparisons Around The World"),
                                    sidebarLayout(
                                      sidebarPanel( 
                                        
                                        # Sex dropdown widget
                                        selectInput("sex2", label = h3("Gender"), 
                                                    choices = list("Women" = "Women",
                                                                   "Men" = "Men"), 
                                                    selected = "Women"),
                                        
                                        # Year dropdown widget
                                        selectInput("year2", label = h3("Year"), 
                                                    choices = list("2005" = "2005",
                                                                   "2010" = "2010",
                                                                   "2011" = "2011",
                                                                   "2012" = "2012",
                                                                   "2013" = "2013",
                                                                   "2014" = "2014"),
                                                    selected = "2014"),
                                        
                                        # Education level dropdown widget
                                        selectInput("level2", label = h3("Education Level"), 
                                                    choices = list("2-Year College" = "Short-cycle tertiary education (ISCED2011 level 5)",
                                                                   "Bachelors" = "Bachelor’s or equivalent level (ISCED2011 level 6)",
                                                                   "Masters" = "Master’s or equivalent level (ISCED2011 level 7)",
                                                                   "Doctoral" = "Doctoral or equivalent level  (ISCED2011 level 8)", 
                                                                   "All" = "Total tertiary education (ISCED2011 levels 5 to 8)"), 
                                                    selected = "Total tertiary education (ISCED2011 levels 5 to 8)"),
                                        
                                        # Field dropdown widget
                                        selectInput("field2", label = h3("Field"), 
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
                                        plotlyOutput("worldMap")
                                      )
                                    )
                           ), 
                           # BarGraph camparison
                           tabPanel("Comparison Of Women Engineering Degree In The USA To The Rest Of The World",
                                    mainPanel(
                                      plotlyOutput("BarGraph")
                                    )
                           )
                ),
                
                # Show the data in a table
                navbarMenu("More Information",
                           tabPanel("Data",
                                    DT::dataTableOutput("table")
                           ),
                           
                           # Gives background information on data
                           tabPanel("Background Information",
                                    includeMarkdown("data_info.md"))
                )
))                  
