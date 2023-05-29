##############################################################################
######   DATA WRANGLING
######   This assignment uses code and questions from 
######   Chapter 10 of R for Data Science 
##############################################################################



#####################################
###   Tibbles
#####################################


## Tibbles are data frames that tweak some of the 
## characteristics in base R data frames to make them
## easier to work with. 

library(tidyverse)

## Most other R packages use regular data frames, so 
## you might want to coerce a data frame to a tibble. 
## You can do that with as_tibble():

data(iris)
class(iris)

iris <- as_tibble(iris)
class(iris)

## You can create a new tibble from individual vectors with 
## tibble(). tibble() will automatically recycle inputs of 
## length 1, and allows you to refer to variables that you
## just created, as shown below.


tibble(
  x = 1:6, 
  y = 1, 
  z = x ^ 2 + y
)


## There are two main differences between tibbles
## and regular data frames. First, printing:
## Tibbles have a refined print method that shows 
## only the first 10 rows, and all the columns that fit
## on screen. This makes it much easier to work with large data. 

## run this code to create a tibble:
tibble(
  a = lubridate::now() + runif(1e3) * 86400,
  b = lubridate::today() + runif(1e3) * 30,
  c = 1:1e3,
  d = runif(1e3),
  e = sample(letters, 1e3, replace = TRUE)
)


## If you need to see more of your data, use print()

nycflights13::flights %>% 
  print(n = 10, width = Inf)

## Second, tibbles are somewhat different with subsetting:


df <- tibble(
  x = runif(5),
  y = rnorm(5)
)

## [[ can extract by name or position; 
## $ only extracts by name.

# by name
df$x
df[["x"]]

## by position (column number)
df[[1]]

## To use these with pipes, you'll need the placeholder "."

df %>% .$x
df %>% .[["x"]]




#####################################
###   Importing data
#####################################



## So far I've given you all of the data that you've needed
## to work with. However, in the future you will need to
## download data and load it into your global environment.
## The data you use will likely come in different formats.
## Let's learn about a couple of them. 


`V-Dem-CY-Core-v13` <- readRDS("~/Desktop/V-Dem-CY-Core_R_v13/V-Dem-CY-Core-v13.rds")


library(haven)
arg_lapop <- read_dta("ARG_2021_LAPOP_AmericasBarometer_v1.2_w.dta")



## Now turn one of those data frames into a tibble. 


arg_lapop <- as_tibble(arg_lapop)


## Use select() to pull out a smaller number of variables and 
## put it in the same data set. 

arg_lapop_small <- select(arg_lapop, )



## Subset your data however you'd like using # and [[ ]]






