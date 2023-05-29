
###############################################################################
######   Homework Assignment Week 8: Data transformation
######   Please make sure your name is in the filename before the .R extension
######   Write your code below each prompt below.
###############################################################################

##### STUDENT NAME: Jalen Mendoza

# Load the dplyr library
library(dplyr)
library(tidyverse)

# Run the code below to create a dataset with some sample data
dataset <- data.frame(
  name = c("Alice", "Bob", "Charlie", "David", "Emily", "Frank"),
  age = c(24, 30, 42, 18, 26, 39),
  gender = c("F", "M", "M", "M", "F", "F"),
  city = c("New York", "Los Angeles", "Chicago", "Miami", "San Francisco", "Boston"),
  salary = c(55000, 72000, 90000, 46000, 68000, 82000),
  hours_worked = c(40, 50, 60, 35, 45, 55)
)

# Using pipes first filter the dataset to only include individuals 
# who work more than 40 hours a week. Then mutate the data set to add 
# a new column called 'hourly_wage' that calculates the hourly
# wage of each individual. Then group the data set gender, and 
# use summarise() to find the average (mean) hourly wage of each
# group. Make sure you put all of this into a new data set and 
# call it whatever you like. 

dataset %>%
  filter(hours_worked > 40) %>%
  mutate(hourly_wage = salary / hours_worked) %>%
  group_by(gender) %>%
  summarise(avg_salary = mean(hourly_wage))


# Now, create a scatter plot with age on the x-axi and
# average hourly wage on the y-axis.

ggplot(data = dataset) + 
  geom_point(mapping = aes(x = age, y = mean(salary)))


