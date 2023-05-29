###############################################################################
######   Homework Assignment 10: Data Transformation
######   Please make sure your name is in the filename before the .R extension
######   Write your code below each prompt below.
###############################################################################

##### STUDENT NAME: Jalen Mendoza

## Load the data set that I provided (Baby_data.rda) into your 
## global environment. If you downloaded it to your computer, it should be 
## in your downloads folder. Right click on the file, choose "open with"
## and then choose "R Studio." If you don't do this step, it might 
## open in R instead of R Studio. This data set contains information 
## about the mother and baby for 42 births. 

library(tidyverse)

## Using BOTH methods that we discussed in our last class,
## visualize the relationship between babies' birth weight
## (variable name is "Birthweight" and it is a continuous 
## variable) and whether the mother smoked during
## pregnancy (variable is "smoker" and it is categorical.)

# Categorical (smoker) and Continuous (Birthweight)

ggplot(data = Baby_data, mapping = aes(x = reorder(smoker, Birthweight, FUN = median), y = Birthweight)) +
  geom_boxplot()

## Now visualize the relationship between babies' birth
## weight and the mother's education (categorical 
## variable "high_school")

ggplot(data = Baby_data, mapping = aes(x = reorder(high_school, Birthweight, FUN = median), y = Birthweight)) +
  geom_boxplot()


## Based on these two visualizations, 
## which variable has a stronger relationship 
## with babies' birth weights? Education or whether 
## the mother was a smoker? How did you draw
## your conclusion? Answer in a comment. 

#Answer:
#Based on the two visualizations, I believe that the smoker variable has a 
#stronger relationship with babies' birth weight.  I concluded this because
#there is a bigger difference between the smoked and did not smoked middle line
#in the box plot than the other categorical value.

## Now visualize the relationship between the mothers' 
## education level (variable is "high_school" and it 
## is categorical) and whether the mother smoked.


## Is your visualization useful? Why or why not? 
## What might be better? Respond in a comment.

# Answer:
#This visualization is useful because it can help find out relations
#between two variables

## Finally, visualize the relationship between the two
## continue variables of the baby's weight and length
## (variables Birthweight and Length.)

ggplot(data = Baby_data) + 
  geom_point(mapping = aes(x = Birthweight, y = Length), alpha = 1)




