###############################################################################
######   Homework Assignment 5: Data Visualization Pt 3
######   Please make sure your name is in the filename before the .R extension
######   Write your code below each prompt below.
###############################################################################

##### STUDENT NAME: Jalen Mendoza

library(tidyverse)
data(mpg)

##### Make sure the mpg data set is in your global environment.
##### Run the code below to create a scatter plot. 
##### What's wrong with this scatter plot? How could you improve
##### our understanding of the distribution of our data using 
##### one of the position adjustments that we learned this week?
##### Explain in a comment below and change the code with the
##### position adjustment to improve the plot. 

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point()

# The problem with this scatter plot is the points on the scatter plot
# are very vague.  By adding position = "jitter" we can see accurate
# points.

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point(position = "jitter")


##### Make sure the WB_Vdem data set is loaded into your
##### global environment. If it is not, you can download it from the
##### overview page for week 5. Right-click and open with 
##### R Studio. 

##### Create a box plot that looks at the distribution of
##### birth.rate for different values of pol_region.
##### When creating a box plot, the categorical variable 
##### always needs to be on the x-axis, and the continuous
##### variable must be on the y-axis. 
##### If you run into issues with this, always make sure
##### that you are spelling the names of the variables
##### correctly! 

#Categorial is pol_region
#Continous is the birth.rate

ggplot(data = WB_Vdem, mapping = aes(x = pol_region, y = birth.rate)) + 
  geom_boxplot() 


##### In a separate plot, change the coordinate system
##### on your box plot so that you switch the x and y-axis. 

ggplot(data = WB_Vdem, mapping = aes(x = birth.rate, y = pol_region)) + 
  geom_boxplot() 


##### What does the dark line in the middle of the box 
##### represent?  Explain in a comment. 

# Answer:
# The horizontal dark line in the middle of th box represents the median

##### Copy and paste that code below. Add a title 
##### to the plot, and change the x-axis and y-axis labels
##### to something more understandable.

ggplot(data = WB_Vdem, mapping = aes(x = birth.rate, y = pol_region)) + 
  geom_boxplot() +
  labs(title = "Birthrate In Different Regions",
       x= "Birth Rate",
       y = "Regions") +
  theme(
    plot.title = element_text(size = 16, face = "bold",hjust = 0.5),
    axis.title.x = element_text(size = 12, face = "italic"),
    axis.title.y = element_text(size = 12, face = "italic"),
  )
