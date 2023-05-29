
###############################################################################
######   Homework Assignment Week 9: Data exploration
######   Please make sure your name is in the filename before the .R extension
######   Write your code below each prompt below.
###############################################################################

##### STUDENT NAME: Jalen Mendoza



library(tidyr)
library(tidyverse)



## similar to the mpg data set, this is about
## 32 cars, including mileage, cylinders, etc
data(mtcars)

help(mtcars)


## First, visualize the distribution of miles per gallon (mpg)
## and Engine (vs). Keep in mind that the engine variable is 
## represented with 0's and 1's, but it is still a categorical
## variable. Let me know if class if you have questions about this.

ggplot(data = mtcars) +
  geom_bar(mapping = aes(x = mpg))

ggplot(data = mtcars) +
  geom_bar(mapping = aes(x = vs))

## Compute the number of observations
## for each value of both variables using count()

mtcars %>%
  count(vs)

mtcars %>%
  count(mpg)

## Try to figure out if there are any outliers in the mpg variable.
## if there are, pull them out of the data set and 
## replace them with NAs. 

ggplot(mtcars) + 
  geom_histogram(mapping = aes(x = mpg), binwidth = 0.5)

outliers <- mtcars %>% 
  filter(mpg < 14 | mpg > 32) %>% 
  select(mpg, cyl, vs) %>%
  arrange(mpg)

outliers

mtcars2 <- mtcars %>% 
  mutate(mpg = ifelse(mpg < 14 | mpg > 32, NA, mpg))


