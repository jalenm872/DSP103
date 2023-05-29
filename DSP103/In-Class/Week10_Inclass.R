##############################################################################
######   Exploratory Data Analysis Pt 2
######   This assignment uses code and questions from 
######   Chapter 7 of R for Data Science 
##############################################################################



## If variation describes the behavior within a variable, covariation 
## describes the behavior between variables. One useful way to spot
## covariation is to visualize the relationship between two variables.
## We will go over some techniques for visualizing covariation
## based on the types of variables that you have. 


##############################
## Categorical and Continuous
##############################

library(tidyverse)
data(diamonds)

## Let's look at the distribution of a continuous variable
## broken down by the values in a categorical variable. 

ggplot(data = diamonds, mapping = aes(x = price, y = ..density..)) + 
  geom_freqpoly(mapping = aes(color = cut), binwidth = 500)

## by choosing "density", we are not looking at the count of 
## observations of your variables, but rather the count
## standardized. This makes the values comparable when
## the number of observations for each possible value of your 
## variable varies widely.

## What's the relationship between quality and price
## based on this plot? 

## Let's also look at a boxplot:

ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
  geom_boxplot()

## This does a good job of ordering our categorical
## variable, but we can always do this with the 
## reorder() function. For example, load the mpg data 
## set. Then create a boxplot looking at the relationship 
## between class (categorical, x) and hwy (continuous, y)

data(mpg)

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()

## We can reorder the values of the categorical variable
## using the reorder() function to reorder based
## on the median of each value:
## x = reorder(class, hwy, FUN = median)
## Where the first value is the categorical variable,
## the second is the variable that we be used to reorder 
## your categorical variable, and the third is the method
## by which you want to order your variable.

ggplot(data = mpg, mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy)) +
  geom_boxplot()


##############################
## Two Categorical Variables
##############################


## To visualize the covariation between categorical variables, 
## you’ll need to count the number of observations for each 
## combination. 

ggplot(data = diamonds) +
  geom_count(mapping = aes(x = cut, y = color))


##The size of each circle in the plot displays how 
## many observations occurred at each combination of values.
## Another approach is to compute the count with dplyr:


diamonds %>% 
  count(color, cut) %>%
  print(n=Inf)

## Then visualise with geom_tile() and the fill aesthetic:
## Heat map


diamonds %>% 
  count(color, cut) %>%  
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = n))



##############################
## Two Continuous Variables
##############################

## You already know the most common way to visualize the relationship
## between two continuous variables: create a scatter plot with 
## geom_point()

ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price))


## Keep in mind that scatter plots become less useful as the size of your 
## dataset grows, because points begin to overlap. 
## You can fix this problem using the alpha aesthetic to add transparency.

ggplot(data = diamonds) + 
  geom_point(mapping = aes(x = carat, y = price), alpha = 1 / 100)




##############################
## Practice
##############################


## Let's do some of this on our own!

data(airquality)

## Here's a tricky question! Recode the variable
## "Wind" so that values below 11 are coded as "not windy"
## and values 11 or above are coded as "windy".  
## Do this using pipes, mutate() and the ifelse() function that 
## we learned about last week. 


airquality <- airquality %>%
  mutate(Wind_dichot = ifelse(Wind>=11,"Windy","Not Windy"))

table(airquality$Wind_dichot,airquality$Wind)



## Now do something similar with the Temp variable.
## Code values above 85 as "hot" and values less than
## or equal to 85 as "not hot".




## Now visualize the relationship between Wind and 
## Solar.R


ggplot(data = airquality, mapping = aes(x = Solar.R, y = ..density..))+
  geom_freqpoly(mapping = aes(color = Wind_dichot), binwidth=25)

ggplot(data = airquality, mapping = aes(x = Wind_dichot, y = Solar.R))+
  geom_boxplot()


## Finally, visualize the relationship between 
## Solar.R and Ozone.

ggplot(data = airquality) +
  geom_point(mapping = aes(x = Solor.R, y = Ozone))



## We can also look at correlation coefficients
## between our variables: 

cor(na.omit(airquality[,1:4]))

