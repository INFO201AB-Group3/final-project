# final-project

* Final project for INFO 201AB
* [Link to Shiny App](https://jtopasna.shinyapps.io/final-project/)

## Project Description
We have chosen to work with the "Percentage of tertiary qualifications awarded to women by field of education"  database from the OECD, the Organisation for Economic Co-operation and Development.  The OECD is a Paris-based organisation with roots in post - WW II Europe. They collect data from around the world and provide access to their statistical databases through [stats.oced.org](http://stats.oecd.org/) website. This website provides a forum in which governments can work together to share experiences and seek solutions to common problems.  

The database we are using provides information about postsecondary degrees awarded to both men and women in 8 different fields and many countries from around the world. [Ourdataset](http://stats.oecd.org//Index.aspx?QueryId=70547)

Our target audience will be current or future university students, researchers and educators.
These statistics can be used by the Universities to influence students at a young age and help create a more diverse number of men and women being awarded postsecondary degrees.

We will use the data to compare and contrast the number of degrees awarded to men and women, and how this has changed in the past decade. We will also compare countries in different parts of the world.  

Specifically, we can ask:

* How has the number of degrees awarded changed between 2005 (the first year they have data) and 2014 (the last year)?
* Are there any differences between degrees awarded to men and women? If so, how? How are specific fields different?
* Are there noticeable differences between two-three countries in different parts of the world? For example, we can compare countries in the North America, Asia, and Europe areas of the world. 
        

## Technical Description
We are using a combination of HTML compiled with KnitR and the Shiny app to format the final presentation
We download and save the data locally in CSV files 

We are using `dplyr` to  wrangling the data set. 
We researched visualization packages and probably utilize `ggplot2` for more interactive charts/maps.
Also we are using statistical analysis and machine learning to help us with find the best averages, differences, standard deviations, etc. To answer our questions concisely.


## Project Setup
We have created a public [repository](https://github.com/INFO201AB-Group3/final-project.git) on GitHub.  
As a starting point we set the following as GitHub Issues for our project. We assigned these to individual group members.
* Compile the data (decide the specific information we are going to download from the website and make sure it is in a useable format.  Clean out any extra data we don't need.)
* Bring the data into RStudio and join different tables and make column names consistent. Data structure should be clear, consistent and concise. 
* Set up a naming convention for variables, functions, and arguments  for consistency across group members (a style guide).
* Begin the process of pulling information from the data frame to see what might be statistically significant. 
* Decide on an initial layout for the visualization and set exactly which questions we will be trying to answer (create a dashboard).
* Decide on the graphs or charts for the different questions/answers. 
* Write text to frame the questions and answers.
We have created a private slack channel named "group project", which is being very useful already.
