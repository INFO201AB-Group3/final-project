# Final Project
# ui.R

# install.packages("DT")
library(shiny)
library(shinythemes)
library(plotly)
library(DT)

# Shiny ui
# Multi-page layout
shinyUI(navbarPage("Analysis of Graduates by Field", theme = shinytheme("flatly"),
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
                                  choices = list("Short-Cycle Tertiary" = "Short-cycle tertiary education (ISCED2011 level 5)",
                                                 "Bachelors" = "Bachelor’s or equivalent level (ISCED2011 level 6)",
                                                 "Masters" = "Master’s or equivalent level (ISCED2011 level 7)",
                                                 # Note: There are two spaces between "equivalent level" and "(ISCED2011..." below. 
                                                 # Need to include the extra space to work correctly.
                                                 "Doctoral" = "Doctoral or equivalent level  (ISCED2011 level 8)", 
                                                 "All" = "Total tertiary education (ISCED2011 levels 5 to 8)"), 
                                  selected = "Bachelors"),
                      
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
                                  selected = "Science, Mathematics and Computing"),
                      hr(),
                      helpText("Data from the Organisation for Economic Co-operation and Development (OECD)")
                      
                    ),
                  
                    # Displays horizontal bar chart              
                    mainPanel(
                      plotlyOutput('hbar')
                    )
                  )
                ),
                
                # Dropdown menu
                      # tabPanel to show line charts of field trends by country
                      tabPanel('By Country',
                         # Add a titlePanel to your tab
                         titlePanel('Field Trends By Country'),
                         
                         # Create a sidebar layout for this tab (page)
                         sidebarLayout(
                           
                           # Create a sidebarPanel for your controls
                           sidebarPanel(
    
                             # Input a country
                             textInput('country', label=h3("Find a Country"), value = 'United States'),
                             
                             # Sex dropdown widget
                             selectInput("sex1", label = h3("Gender"), 
                                         choices = list("Women" = "Women",
                                                        "Men" = "Men"), 
                                         selected = "Women"),
                             
                             # Education level dropdown widget
                             selectInput("level1", label = h3("Education Level"), 
                                         choices = list("Short-Cycle Tertiary" = "Short-cycle tertiary education (ISCED2011 level 5)",
                                                        "Bachelors" = "Bachelor’s or equivalent level (ISCED2011 level 6)",
                                                        "Masters" = "Master’s or equivalent level (ISCED2011 level 7)",
                                                        # Note: There are two spaces between "equivalent level" and "(ISCED2011..." below. 
                                                        # Need to include the extra space to work correctly.
                                                        "Doctoral" = "Doctoral or equivalent level  (ISCED2011 level 8)", 
                                                        "All" = "Total tertiary education (ISCED2011 levels 5 to 8)"), 
                                         selected = "Bachelors"),
                             hr(),
                             helpText("Data from the Organisation for Economic Co-operation and Development (OECD)")
                             
                           ),
                           
                           # Displays the line charts
                           mainPanel(
                             plotOutput('line')
                           )
                         )
                  ),
                
                # Show the data in a table
                tabPanel("Data",
                         DT::dataTableOutput("table")
                )
                  
))                   
