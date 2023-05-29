##############################################################################
######   DATA TRANSFORMATION
######   This assignment uses code and questions from 
######   Chapter 5 of R for Data Science 
##############################################################################


### As always, let's do some practice of the data visualization
### techniques that we learned last week.
### Load the data "coral_bleaching_events.rda"
### First, create a box plot with the region ("Entity") on the x-axis and
### the number of moderate bleaching events ("Moderate") on 
### the y-axis. Then change the coordinate system so the 
### x and y axes are flipped.




### Run the following code and look at the resulting plot.
### Give the plot a title and change the x and/or y-axis labels 
### to something that helps us understand our data visualization. 

ggplot(data = coral_bleaching_events, (mapping = aes(x = Year, y = Total_bleaching_events, color = Entity))) + 
  geom_line() + 
  geom_point()



####################################
###### Data Transformation
####################################
library(tidyverse)

#### Load data
install.packages("nycflights13")
library(nycflights13)
data(flights)

##########
## Filter
##########

### The filter function allows you to subset data
### based on a set of criteria. 

### Don't forget the comparative operators that we already learned!
#####        Less than: <
#####        Greater than: >
#####        Less than or equal to: <=
#####        Greater than or equal: to >=
#####        Is equal to: ==
#####        Is not equal to: != 

### This code creates a data sit with only observations
### from January 1st:
jan1 <- filter(flights, month == 1, day == 1)

view(jan1)


### Write code to select only observations
### from March 15th. Name the data set
### something intuitive.



### Good! Now run this code:
filter(flights, month = 1)
### Why did we get an error?


### The filter function automatically combines 
### arguments with "and," which you can do manually
### with "&". For example: 

jan1 <- filter(flights, month == 1, day == 1) ## is the same as:

jan1 <- filter(flights, month == 1 & day == 1)

### In the above code, we are saying that the resulting data set 
### must meet BOTH criteria. 
### But what if you want to say "or" instead? You can use
### the "|" operator (vertical bar). This allows 
### observations that fit one OR the other criteria:

feb_march <- filter(flights, month == 2 | month == 3)

### The "!" operator also means "not". So you can tell 
### the filter function to exclude certain values, combined with
### the & and | operators:

not_verylate_flights <- filter(flights, !(arr_delay > 120 | dep_delay > 120))


### Write code to select all flights that departed at least 10
### minutes early AND arrived 10 minutes early.
### Use the help info for the data set to learn about your variables.




##########
## Arrange
##########

### The arrange function reorders your rows. 
### For example: 

flights_arranged <- arrange(flights, year, month, day)
view(flights_arranged)


### Use desc() to re-order by a column in descending order:

arrange(flights, desc(dep_delay))

### Now is a good time to introduce you to NA's. They are
### missing values in a data set. If you ever want to know
### whether a value is missing or not, you can use the
### is.na() function.

x <- NA
y <- 10

is.na(x)
is.na(y)

### The arrange function always orders missing data at the
### end. For example:

df <- tibble(x = c(5, 2, NA)) ## create a tibble to use as an example
arrange(df, x)


### Use arrange to sort flights in ascending order by 
### the plane's departure delay, and then second in descending order
### by flight number. 


############
### Select
############

### The select function is one of the easiest functions to
### work with. It just creates a smaller data set with 
### only the variables you select:

smaller_data <- select(flights,carrier, flight)


### Create a smaller data set with any four variables
### that interest you. 


### There are a number of helper functions you can use within select():
###     starts_with("abc"): matches names that begin with “abc”.
###     ends_with("xyz"): matches names that end with “xyz”.
###     contains("ijk"): matches names that contain “ijk”.
###     num_range("x", 1:3): matches x1, x2 and x3.



############
### Mutate
############

### The mutate function adds a column at the end of your data set
### that is a function of existing columns.


mutate(flights_sml,
       gain = dep_delay - arr_delay
)

## This creates variables "gain".

## Create a variable with the speed of the plane.
## Divide the air time by the distance and multiply by 60. 











