###############################################################################
######   INTRODUCTION TO ggplot2
######   Please make sure your name is in the filename before the .R extension
######   Write your code below each prompt below.
###############################################################################


##### Let's start off by making sure we can use tidyverse! 
library(tidyverse)


##### Also, check to make sure the mpg data set is in your global 
##### environment. If it is not, run this code:

mpg <- mpg

##### Take a look at the help documentation for the mpg data set
##### by using the help() function. 
##### In a comment below, specify two variables that are continuous and
##### then specify two variables that are categorical. 

# Two continuous variables are cty and displ
class(mpg$cty)
class(mpg$displ)
# Two categorical variables are manufacturer and model
class(mpg$manufacturer)
class(mpg$model)

##### Create a scatter plot with the year of manufacture 
##### on the x axis and the highway miles per gallon
##### on the y axis. It will be a strange looking scatter plot! 
##### Use the help documentation to figure out
##### the names of the variables if you cannot remember. 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = year, y = hwy))


##### Now, let's add an additional variable to this plot
##### by assigning a color to the type of drive train. 
##### Again, use the help documentation to figure out which 
##### variable corresponds to the type of drive train, and 
##### review our in-class assignment to figure out how to
##### change the color of our points to correspond to the 
##### type of drive train. 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = hwy, color = drv))


##### Let's work on some of the exercises from the book. 
##### First, what's wrong with this code? Why aren't the points blue?
##### Answer in a comment.


# It is not blue because of the quotation marks, we are just
# naming the colour to "blue"
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

##### Map a continuous variable to color, size, and shape. 
##### How do these aesthetics behave differently for categorical vs. 
##### continuous variables? Answer the question in a comment.

# Color on continuous value will increase from black to a color 
# as it increases in value
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = displ))

# Size on a continuous value will increase from a small dot to a big
# dot as the value increases
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = displ))

# Shape on a continuous value does not work and throws an error
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = hwy))

# Shape on a categorical value will work but it only has 6 shapes
# and the rest do not show
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = trans, y = hwy, shape = trans))

# Size on a categorical value will work but it shows warning message
# that it is not advised
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = hwy, size = drv))

# Color on a categorical value will change color with each different value
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = hwy, color = drv))

##### What happens if you map the same variable to multiple aesthetics?
##### Try this below, and answer in a comment. 

#Having multiple will work as long as the aestitics work with the values
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = hwy, size = hwy, fill = displ))



##### Finally, what happens if you map an aesthetic using the comparative 
##### that we learned last week? For example, color = displ < 5
##### Create a scatter plot below with any two continuous variables on the 
##### x and y axis. Then instead of mapping an aesthetic to a
##### variable name like we did in class (ex: color=cyl), map an aesthetic to
##### color=displ<5 
##### Explain what happens in a comment. 

# With color=displ<5, it colored all the points on the graph that was
# less than 5 on the x-cord.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color=displ<5))





