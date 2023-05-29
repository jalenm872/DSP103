##############################################################################
######    DATA VISUALIZATION Pt 2
######    Homework assignment 
##############################################################################

####### STUDENT NAME: Jalen Mendoza

## Clear your global environment. 
## Load the tidyverse package and mpg data set.

library(tidyverse)
data(mpg)

## Create a scatter plot that looks at the relationship
## between city miles per gallon (cty) on the x axis
## and highway miles per gallon (hwy) on the y axis. 
## Facet the plot by both the year and class. 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty, y = hwy)) + 
  facet_grid(year~class)

## Create the same plot, but color the points by
## the type of transmission.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty, y = hwy, color = trans)) + 
  facet_grid(year~class)

## Load the diamonds data set. Use the help information
## for the diamonds data set if you don't know
## the names of the variables mentioned below. 

data(diamonds)

## Plot the relationship between price (x-axis) and 
## length in mm (y-axis). Use both geom_point() and 
## geom_smooth on the same plot. 

ggplot(data = diamonds) + 
  geom_smooth(mapping = aes(x = price, y = y)) +
  geom_point(mapping = aes(x = price, y = y))

## Now change the line type by the color 
## of the diamonds. (variable name is 'color'.)

ggplot(data = diamonds) + 
  geom_smooth(mapping = aes(x = price, y = y, color = color)) +
  geom_point(mapping = aes(x = price, y = y, color = color))


## Finally, create two bar plots of the variable
## "color." Use the count (total number of observations
## for each value) for one bar plot,
## and use the proportion for the other bar plot. 

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = color, y = stat(count)))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = color, y = stat(prop)))


## Bonus question: What does geom_col() do? 
## How is it different to geom_bar()?

ggplot(data = diamonds) + 
  geom_col(mapping = aes(x = color, y = price))

# Geom Bar makes the height of the bar proportional.
# Geom Column represents heights in the data
