##############################################################################
######   Exploratory Data Analysis
######   This assignment uses code and questions from 
######   Chapter 7 of R for Data Science 
##############################################################################



##################################
## Visualizing distributions
##################################

library(tidyverse)
data(diamonds)


## Categorical variables 

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))

## You can compute the actual number of observations
## for each value using count()

diamonds %>% 
  count(cut)





## Continuous variables

ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.5)


## You can compute this with the following:
diamonds %>% 
  count(cut_width(carat, 0.5))







##################################
## Typical Values
##################################


## Let's try a smaller binwidth to think
## about typical values in our data

ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.01)


## I'd also recommend looking at some measures
## of central tendency
diamonds %>%
  summarise(mean(carat), median(carat), sd(carat))




### This figure shows the length in minutes of 
### 272 eruptions of Old Faithful in Yellowstone:

data(faithful) 
ggplot(data = faithful, mapping = aes(x = eruptions)) + 
  geom_histogram(binwidth = 0.25)


### Are there two different processes going on? 



## We would miss this if we 
## only calculated measures of central tendency: 

faithful %>%
  summarise(mean(eruptions), median(eruptions), sd(eruptions))





##################################
## Outliers
##################################

## Outliers are values in yoru data that are significantly
## different from other values in your data. We want to identify 
## outliers in order to figure out whether they are due ti
## measurement error, data entry error, or an actual
## characteristic of our data. 


## effect of outliers
hourly_wage <- c(10, 125, 15, 20, 17, 16, 20)

mean(hourly_wage)
median(hourly_wage)


## more examples:

ggplot(diamonds) + 
  geom_histogram(mapping = aes(x = y), binwidth = 0.5)


## We can also zoom to small values on the y or x axis
## using coord_cartesian()

ggplot(diamonds) + 
  geom_histogram(mapping = aes(x = y), binwidth = 0.5) +
  coord_cartesian(ylim = c(0, 50))



## now let's pull them out of our data using
## functions from dplyr

outliers <- diamonds %>% 
  filter(y < 1 | y > 20) %>% 
  select(price, x, y, z) %>%
  arrange(y)

outliers


## What to do with these values?
## If you can't figure out what's wrong
## with them and replace them with the correct
## values, I recommend replacing them
## with NA's. Using the ifelse() function:

diamonds2 <- diamonds %>% 
  mutate(y = ifelse(y < 3 | y > 20, NA, y))






##########################################
###### Let's practice some
###### of this with a new data set
##########################################


## load data on air quality in NYC in 1973
data(airquality)

## First, explore this data set. Figure out which variables
## are categorical and which are continuous. 





## Visualize the distributions of all
## five variables below using the correct graphs.
## Look at the variables and think about what bandwidth 
## you want to use.

## Compute the actual number of observations for 
## two of your variables using count()








## What can we say about the typical values 
## of the variable Ozone? Solar.R?









### Are there any outliers in the Solar.R variable?
### What about the Ozone variable?
### If you see outliers, pull them out and take a look at them
### using the filter and arrange functions. 




##########################################
###### One more time with a new data set
##########################################


## similar to the mpg data set, this is about
## 32 cars, including mileage, cylinders, etc
data(mtcars)


## Look at the distribution of miles per gallon (mpg)



## Try to figure out if there are any outliers in mpg.
## if there are, pull them out of the data set and 
## replace them with NAs. 


























