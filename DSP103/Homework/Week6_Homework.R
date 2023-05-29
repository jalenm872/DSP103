###############################################################################
######   Homework Assignment 6: Data Transformation
######   Please make sure your name is in the filename before the .R extension
######   Write your code below each prompt below.
###############################################################################

##### STUDENT NAME: Jalen Mendoza

### Make sure the flights data set is loaded in your global environment. 
### Use the help documentation for the flights data set if you do not
### remember variable names. 

library(tidyverse)

### To begin, use the filter function to create separate new data sets for 
### all flights that: 

### Had an arrival delay of two or more hours.

### Flew to Houston (IAH or HOU)

### Departed in the summer (July, August, and September)

new_flights <- filter(flights, (arr_delay >= 120), (dest == "IAH" | dest == "HOU"),
                      (month == 7 | 8 | 9))


### Using the arrange() function, sort flights so that the most 
### delayed flights are first. 

arrange(new_flights, desc(dep_delay))


### Use the select() function AND one of the 'helper' functions
### that I mentioned in class (starts_with(), ends_with(), contains() )
### to create a data set that ONLY contains variables that describe
### how delayed each flight departed or arrived. 

new_flights_1 <- select(flights, starts_with("dep"), starts_with("arr"),
                        starts_with("air"))  

### This final question has three parts:
###     1) Recreate the "gain" variable that we made using the mutate()
###     function in class. 
###     2) Now use the mutate function to create a variable
###     that tells us how many hours the plane was in the air
###     (divide air_time by 60) to create this variable. 
###     3) Then divide your "gain" variable by
###     the number of hours of flight time to create a variable
###     that tells us the amount of time gained per hour of flight time. 

mutate(new_flights_1,
       gain = dep_delay - arr_delay,
       time_in_air_hour = air_time/60,
       gain_time = gain/time_in_air_hour
)
