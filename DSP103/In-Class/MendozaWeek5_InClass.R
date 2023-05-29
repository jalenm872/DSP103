##############################################################################
######   DATA VISUALIZATION PART 3
######   This assignment uses code and questions from 
######   Chapter 3 of R for Data Science 
##############################################################################


library(tidyverse)

##### Let's practice some of the data visualization techniques that 
##### we learned last week! Load the WB_Vdem data set.
##### Plot the relationship between access.electricity (x-axis) and birth.rate (y-axis).
##### Use both geom_point and geom_smooth.
##### Facet the plot by pol_region. You can use 
##### facet_wrap or facet_grid.
##### Don't hesitate to go back to your code from last week!

ggplot(data = WB_Vdem, mapping = aes(x = access.electricity, y = birth.rate)) + 
  geom_point() +
  geom_smooth()+
  facet_grid(pol_region~.)



##### Now let's practice creating a bar plot. 
##### Use the variable "regime"

ggplot(data = WB_Vdem) + 
  geom_bar(mapping = aes(x = regime))



################################################
################ Position Adjustment
################################################


##### Let's move on to new material.
##### We'll use the old diamonds data set now, so make sure it is loaded
##### into your global environment. 
##### When creating bar plots, we can also change the color of the bars
##### manually. First, create a bar plot
##### using the variable "cut."


data(diamonds)
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, color = cut))
  


## The "color" aesthetic changes the border of the bars,
## whereas the "fill" aesthetic changes the (surprise!) fill.
## Add these aesthetics to your plot.






##### Try mapping the fill aesthetic to a different variable: clarity
##### You'll see that the bars are automatically stacked. 

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))




#### The stacking is performed automatically by the position adjustment.
#### If you want to change the position adjustment, you have a few 
#### different options. For this, make sure your aes is in the ggplot
#### function like so:

ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar()


### Then add your position adjustment: 

ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(position = "identity")


### Identity doesn't stack your third variable clarity, but rather 
### plots it exactly to the corresponding count on the y-axis. 
### Notice how the maximum value on the y-axis changes between plots.
### To make this somewhat more useful, we can increase the transparency
### of our bars using alpha: 

ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/4, position = "identity")

## Go ahead and play with the alpha a bit to see how it works. 

### Position=fill works like stacking, but makes each bar the same
### height. This allows you to compare proportions across groups. 

ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar( position = "fill")


### Position=dodge is a personal favorite. It places overlapping
### objects beside one another, allowing us to compare values.

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")



### There's one more position that useful for scatter plots but not for 
### bar plots. The "jitter" position adds a small amount of random noise
### to each point so we can see where there is a grouping of observations. 
### We need to use the mpg data set for this one, because it has 
### fewer observations. Load mpg, and plot displ on the x-axis and 
### hwy on the y-axis. 

data(mpg)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))



### After you run that code, add position = "jitter"
### and compare your plots.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy),
             position = "jitter")


################################################
################ Coordinate Systems
################################################


#### First, let's learn to create a box plot. 
#### We're going back to the mpg data set! 

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()

which(mpg$hwy>40)

mpg$model[213]

### Box plots tell you the median, first and third
### quartile, whiskers with 1.5 the inter-quartile range
### and outliers. 

### The first coordinate change that is sometimes useful
### mainly applies to boxplots. We can switch the x and
### y axis like so:

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()



### We can also do this with a bar plot:


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))+
  coord_flip()


### We can visualize this data differently using 
### polar coordinates. 

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))+
  coord_polar()



#### Finally, we will not have time to learn about 
#### spatial data, but it's important to know
#### that R has excellent tools for creating maps.

install.packages("maps")
library(maps) ### only necessary so that we can load spatial data

nz <- map_data("nz")

### let's look at a basic map of New Zealand

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", color = "black")

## The aspect ratio is off! coord_quickmap
## can fix this:


ggplot(nz, aes(long,lat, group = group)) +
  geom_polygon(fill = "white", color = "black") +
  coord_quickmap()



##################################################
########## Some basic aesthetics 
##################################################


#### It's possible to customize various parts of your
#### plots in ggplot2, including the title, x and y-axis 
#### labels. 
#### Play around with some of these functions:


ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  labs(title = "Engine Size and Highway MPG",
       x="Engine Size",
       y="Highway MPG") +
  theme(
    plot.title = element_text(size = 16, face = "bold",hjust = 0.5),
    axis.title.x = element_text(size = 12, face = "italic"),
    axis.title.y = element_text(size = 12, face = "italic"),
  )


#### There are so many ways to customize a plot that
#### I cannot remember all of them. Use the ggplot2
#### cheat sheet that I provided last week to see
#### additional ideas. Google is always helpful as well. :)











