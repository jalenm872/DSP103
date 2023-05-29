##############################################################################
######    DATA VISUALIZATION Pt 2
######   This assignment uses code and questions from 
######   Chapter 3 of R for Data Science 
##############################################################################


####### STUDENT NAME: Jalen Mendoza



### This week, we will build upon the data visualization skills that we 
### learned last week using the ggplot2 package. 
### First, let's make sure we have the right packages and data

library(tidyverse)
data(mpg)


### We previously learned how to add information to a plot by using 
### aesthetics. 
### Write code below to look at the effect of engine size 
### (x = displ) on highway mileage (y = hwy)
### Add information by coloring the points by 
### the car's class (variable = class). 
### Remember that the basic formula for ggplot is:

###### ggplot(data = <DATA>) + 
###### <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))


### Another way of adding this information is through facets. 
### Facets refer to the ability to create multiple panels or 
### subplots based on one or more variables in a data set. 
### The following code facets your plot by class using 
### facet_wrap()


#Splits the graphs apart so we can read it better
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)


### If you want to facet by two variables, use the 
### facet_grid() argument and put 
### a different variable in your formula, before
### the "~":


# We can break down the data set to multiple variables
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv~cyl)


### Now take a look at this plot below.
### What does the "." do? 

#splitting the graph up to just different drive trains

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)


### Let's take a look at the help information for facet_wrap.

help("facet_wrap")
??facet_wrap

#####################################################
#########           Geometric Objects
#####################################################

### So far, the only geom that we've used is the 
### point geom. A geom is the geometrical object that 
### we use to represent our data. There are many more that
### we can use. Compare these two plots:

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))


### If we are using a different geom, we need to know
### which mapping arguments work with which geoms. 
### For geom_smooth, we can add information by creating
### different lines, but not different points: 


ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))


### Write code below that looks at displ on the x axis,
### and hwy on the y axis, but as a scatter plot. Instead of 
### adding information by changing the line type (like above)
### change the color of the dots to correspond to different 
### values of drv. 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))


## Compare the two plots 


# The scatter plot takes all the values and relations and puts it into one graph
# While the one before does the same but shows the confidence line for each

## To add multiple geoms to the same plot, simply add the two geom
## functions together. Make sure your + sign is always
## at the end of your line of code rather than the beginning. 
## Add your geom_point() function to the code below: 

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv)) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))

  

## This does get a bit messy because some of our code is
## duplicated. You can avoid this by also passing your 
## mappings to ggplot() instead of to the geom function: 

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()
  
  
#####################################################
#########           Statistical Transformations
#####################################################

## Let's work with a new data set that is already in the 
## tidyverse group of packages.

data(diamonds)

## click on the data set to take a look at it. 
## Then let's look at a bar plot: 

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

## ggplot is doing a very basic data transformation
## by counting the number of observations for each
## value of cut and plotting them on the Y axis. 
## That transformation is passed through the "stat" argument.
## Look at the help info for geom_bar.


## Every geom has a stat argument, but you can also create
## the same code with a stat function (as opposed to stat arguiment)
## For example: 

ggplot(data=diamonds) + 
  stat_count(mapping=aes(x=cut))



## There are many ways to override the 
## "stat" default, depending on which geom you are using. 
## Take a look at this resulting plot. 
## How does it differ from the one above? 


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))


## One of the reasons why you might want to use 
## the stat explicitly is to call attention to the 
## statistical transformation that you're using.
## Run this code:


ggplot(data = diamonds) + 
  stat_summary(        ## will provide a summary of variables
    mapping = aes(x = cut, y = depth), 
    fun.min = min,     ## plot the minimum values
    fun.max = max,     ## plot maximum values
    fun = median()       ## use median (default is mean)
  )

ggplot(data = diamonds) + 
  stat_summary(        ## will provide a summary of variables
    mapping = aes(x = cut, y = depth), 
    #fun.min = min,     ## plot the minimum values
    #fun.max = max,     ## plot maximum values
    fun = mean       ## use median (default is mean)
  )

