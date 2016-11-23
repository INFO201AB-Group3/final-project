# final-project

* Final project for INFO 201AB

## Project Description
We have chosen to work with the "Percentage of tertiary qualifications awarded to women by field of education"  database from the OECD, the Organisation for Economic Co-operation and Development.  The OECD is a Paris-based organisation with roots in post - WW II Europe. They provide a forum in which governments can work together to share experiences and seek solutions to common problems.  They collect data from around the world and provide access to their statistical databases through [stats.oced.org](http://stats.oecd.org/) website. 

The database we are using provides information about postsecondary degrees awarded to both men and women in 8 different fields and many countries from around the world.  [Our dataset](http://stats.oecd.org//Index.aspx?QueryId=70547)

Our target audience will be current or future university students and educators.
These statistics can be used by the University to influence students at a young age and help create a more diverse number of men and women being awarded postsecondary degrees. 

Ideally, we can use the data to compare and contrast the number of degrees awarded to men and women, and how this has changed in the past decade.  We can also compare countries in different parts of the world.  

Specifically, we can ask:

* How has the number of degrees awarded changed between 2005 (the first year they have data) and 2014 (the last year)?
* Are there any differences between degrees awarded to men and women? If so, how? How are specific fields different?
* Are there noticeable differences between two-three countries in different parts of the world? For example, we can compare countries in the North America, Asia, and Europe areas of the world. 
		

## Technical Description
We are planning on using a combination of HTML compiled with KnitR and the Shiny app to format the final presentation
We will be downloading and saving the data locally in CSV files (OECD also provides an API, but we probably won’t need to use it)
Most of our data wrangling will be with `dplyr`, although we may find other libraries useful.
We will be researching visualization packages and will probably utilize `ggplot2` or `ggvis` for more interactive charts/maps.
We will using statistical analysis/machine learning to help us with finding the best averages, differences, standard deviations, etc. to use to answer our questions concisely.
Our biggest challenge will be finding the best possible way to visually present information to the audience with so many options available.

## Project Setup
We have created a public [repository](https://github.com/INFO201AB-Group3/final-project.git) on GitHub.  
As a beginning point we will set the following as GitHub Issues for our project.  We are assigning these to individual group members.
* Compile the data (decide the specific information we are going to download from the website and make sure it is in a useable format.  Clean out any extra data we don’t need.)
* Bring the data into RStudio and join different tables and make column names consistent.  Data structure should be clear, consistent and concise. 
* Set up a naming convention for variables, functions, and arguments  for consistency across group members (a style guide).
* Begin the process of pulling information from the data frame to see what might be statistically significant. 
* Decide on an initial layout for the visualization and set exactly which questions we will be trying to answer (create a dashboard).
* Decide on the graphs or charts for the different questions/answers. 
* Write text to frame the questions and answers.
We have created a private slack channel named “group project”, which is being very useful already.