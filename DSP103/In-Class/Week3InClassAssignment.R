##############################################################################
######   INTRODUCTION TO DATA SETS AND DATA VISUALIZATION 
######   This assignment uses code and questions from 
######   Chapter 3 of R for Data Science 
##############################################################################


####### STUDENT NAME: Jalen Mendoza




##### This week we will start off with packages.
##### a package is a collection of functions, data, and documentation that 
##### can be easily installed and loaded into the R environment. Packages 
##### provide a way for users to share their code with others, and to reuse 
##### code written by others.
##### The first time you ever use a package, you must 
##### use the "install.packages()" function. Inside the parentheses, you 
##### insert the package name in quotations.  You do not need to do this after the 
##### first time you download a package because the package is now on your computer.  
##### However you do need to import the package each time you use it using the function 
##### library(). Like the function install.packages(), you should put the package name 
##### in the parentheses. However, it does not need to be in quotes. 
##### I will always write the code that downloads and imports packages for you.

##### Run the code below to download and import the set of packages "tidyverse".  
##### You will see some red text in the console. That's normal.

install.packages("tidyverse")
library(tidyverse)

#######################################
##### Before we use the tidyverse, let's also talk about data. 
##### Data frames have rows and columns.  Each row contains an observation
##### and each column contains a feature. 
##### We are first going to use a data frame that we downloaded from
##### tidyverse. 

mpg <- mpg

##### This data frame was downloaded to your computer when you
##### downloaded the tidyverse package, but it was not yet in
##### your environment. That line of code assigned it to an object
##### so we can easily use the data frame. 
##### Click on the data frame to look at it. 
##### Look at the help documentation for the data set to
##### learn about the variables. Note that this only works because
##### this data set was in a package! 


print(mpg$year)

##### Let's practice some of the functions that we learned in our first assignment.
##### Accessing variables in data frames is a little different from 
##### accessing variables that exist on their own. When we want
##### to use the variables in the data frame, we need to type the name
##### of the data frame, then the dollar sign $ followed by the variable name
##### like so:   DataSetName$VariableName


##### Let's start by getting the length of the first variable, 
##### "manufacturer". Type your code below. 

length(mpg$manufacturer)


##### This tells us how many elements there are in that variable.
##### In other words, it tells us the number of observations.

##### To practice the syntax of variables in datasets, get the 
##### class (using the class() function) of two variables below.
##### Remember the syntax for a variable in a data set is:
##### DataSetName$VariableName

class(mpg$displ)
class(mpg$trans)


##### Remember square brackets? We use them to find individual 
##### elements in a vector or variable. Find the 116th
##### observation of the variable "model".

mpg$model[116]


##### Now let's practice some of the data visualization that you read 
##### about in this week's chapter. 
##### Let's answer the question: " Do cars with big engines use more fuel 
##### than cars with small engines?"
##### Form your own hypothesis.

# I believe cars with bigger engines use more fuel than cars with smaller
# engines

##### We will use the ggplot package (part of tidyverse) to plot the 
##### relationship between engine size and fuel usage. Run this code:

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

##### Do you find evidence for or against your hypothesis?
##### Now we will talk through the code above (in class). 

##### Here's the ggplot template provided in your text: 

ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))


##### This code will only work if you replace portions with your
##### data, variables, etc. 

##### To practice, make a scatterplot of hwy vs cyl below. 

ggplot(data = mpg) +
  geom_point(mapping = aes(x = cyl, y = hwy))


##### Let's return to the engine size and fuel usage
##### scatter plot. 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))


##### We see some outliers. Why might some vehicles have higher
##### gas mileage given their engine size? 

##### Let's add a third variable to the plot by mapping it
##### to an aesthetic. Aesthetics include things like the size, 
##### the shape, or the color of your points. 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))


##### To map an aesthetic to a variable, associate the name of the 
##### aesthetic to the name of the variable inside aes(). ggplot2 
##### will automatically assign a unique level of the aesthetic 
##### (here a unique color) to each unique value of the variable, 
##### a process known as scaling. 



###### We could have also used the size aesthetic. 


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

##### Change the aesthetic from "size" to "alpha" and "shape"
##### to see what happens.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

##### You can also change the color manually, which doesn't 
##### add information, but changes the appearance of the plot.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")



##### Let's work on some of the exercises from the book. 
##### First, what's wrong with this code? Why aren't the points blue?

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

##### Which variables in mpg are categorical? Which variables are
##### continuous? 
##### Map a continuous variable to color, size, and shape. 
##### How do these aesthetics behave differently for categorical vs. 
##### continuous variables?




##### What happens if you map the same variable to multiple aesthetics?



