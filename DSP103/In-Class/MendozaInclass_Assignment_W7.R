##############################################################################
######   DATA TRANSFORMATION Pt 2
######   This assignment uses code and questions from 
######   Chapter 5 of R for Data Science 
##############################################################################

library(dplyr)

#####################################
###   Pipes
#####################################


## We are going to do today's less a little out of order than the book!
## We will start with pipes, which allow you to chain together multiple 
## operations in a way that is both easy to read and easy to write.
## The pipe operator in R is represented by %>%, and it takes the output 
## of one function and passes it as the input to the next function in the chain. 

# Create a basic data frame
df <- data.frame(
  name = c("Alice", "Bob", "Charlie", "David", "Emily"),
  age = c(25, 30, 35, 40, 45),
  gender = c("F", "M", "M", "NB", "F"),
  salary = c(50000, 60000, 70000, 80000, 90000)
)

## We want to:
##       1)  Filter the data to only include people who are over 30 years old (filter)
##       2)  Create a new column that calculates each person's salary as a 
##              percentage of the average salary for the whole group (mutate)
##       3) Select only the name, age, and salary columns for the final output (select)


## Compare this code:
newdata <- filter(df, age>30)
newdata1 <- mutate(newdata, salary_pct = salary/mean(salary)*100)
select(newdata1,name,age,salary_pct)


## With this code:
df %>% 
  filter(age > 30) %>% 
  mutate(salary_pct = salary / mean(salary) * 100) %>% 
  select(name, age, salary_pct)




#### Let's practice. Here's another dataset:

students <- data.frame(
  name = c("John", "Samantha", "David", "Sarah", "Emily"),
  age = c(16, 15, 14, 16, 15),
  grade_level = c(9, 10, 11, 10, 9),
  math_score = c(85, 92, 78, 88, 91),
  science_score = c(79, 85, 84, 90, 82),
  english_score = c(91, 89, 87, 82, 94)
)


## We want to filter the data set to only include students who 
## are in grade 9 or 10, then calculate a new variable total_score 
## that is the sum of the student's math, science, and English test scores, 
## and finally select only the variables for name, grade level, and total_score.
## Use pipes and dplyr functions to do this below:

df %>%
  filter((grade_level = 9 || 10))
  







#####################################
### Summarise and Group_by
#####################################

data(flights)

### The summarise() and group_by() functions work well together.
### group_by() groups data by variables that we specify, and
### summarise() provides summary statistics about our data, 
### and is most useful when done by groups. 

### Let's create another simple data frame: 

students <- data.frame(
  name = c("John", "Alice", "Peter", "Mary", "Lucas", "Emily", "David", "Sophie"),
  age = c(19, 20, 19, 20, 19, 20, 19, 20),
  gpa = c(3.2, 3.5, 3.8, 3.1, 3.6, 3.9, 3.4, 3.7),
  year_level = c("sophomore", "junior", "sophomore", "junior", "sophomore", "junior", "sophomore", "junior")
)

## If we want to group by year_level, we can use group_by()

grouped_data <- group_by(students, year_level)

## now we can summarize the gpa by students' year level: 

summarise(grouped_data, mean(gpa), sd(gpa))

## How might we do those two operations using pipes?


students %>%
  students1 <- group_by(students, year_level) %>%
  summarise(students1, mean(gpa), sd(gpa))



## Sometime we want to group by more than one variable.
## Just name the variables in order of how you want them grouped

flights %>%
  group_by(month,day) %>%
  summarise(delay=mean(dep_delay,na.rm=TRUE))


## by using these two functions together, we create a grouped 
## summary, which tells us the mean delay by day


## Let's combine this with pipes. Say we want to explore the relationship
## between the distance and average delay for each location. 
## First, group your data by destination and put that grouped data
## into a grouped data frame called "by_dest"

## I wrote some of the code below. Fill the rest in using my instructions

delays <- flights %>% 
     %>%                     ## group by destination
  summarise(
    count = n(),             ## this tells us the number of observations
    dist =                   ## get the mean of distance, and take care of NA's
    delay =                  ## get the mean of arrival delay, and take care of NA's
  ) 

ggplot(data = delays, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)

## If you want to ungroup, use the ungroup() function:

delays %>% 
  ungroup() %>%            
  summarise(flights = n()) 


########################
###### Practice
########################

## First, filter for flights in January departing from JFK airport.
## Then calculate the distance in km rather than the original units 
## of miles by multiplying them by 1.61. Use pipes:


## Now arrange the data in descending order of distance.

## Summarize the data by carrier, calculating the average 
## and maximum distance traveled. This should use group_by()
## and summarise ()


## Create a scatter plot with the average distance on the x-axis 
## and the maximum distance on the y-axis, colored by carrier.

