
##############################################################################
######         Final Exam
##############################################################################


####### STUDENT NAME: Jalen Mendoza


## Load the final_exam.rda data set into your global environment. 
## Make sure you have loaded the tidyverse package.

library(tidyverse)
library(ggplot2)
library(dplyr)
# load("/Users/jalenmendoza/Desktop/finalexam.rda")
View(finalexam)

## Let's explore the relationship between the level of democracy in a country
## and human rights violations. 


## The variable v2x_polyarchy comes from the V-Dem data set and is a measure of 
## electoral democracy. Higher values mean a country is more 
## democratic and lower values mean a country is more authoritarian. 
## Look at the distribution of that variable by creating a histogram below. 
## The variable ranges from 0 to 1 (which is important for choosing your binwidth)

ggplot(data = finalexam) + 
  geom_histogram(mapping = aes(x = v2x_polyarchy), binwidth = 0.5, fill = "steelblue") +
  labs(
    title = "Distribution of v2x_polyarchy in Countries",
    x = "v2x_polyarchy",
    y = "Number of Countries"
  )
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title.x = element_text(size = 12, face = "italic"),
    axis.title.y = element_text(size = 12, face = "italic"),
  )


## The variable physint_sum is from the CIRIGHTS
## data set, and it is a variable that measures the amount of
## respect for physical integrity rights that people enjoy in a country. 
## It runs from 0 to 8, and higher values mean that there are more 
## protections for physical integrity rights (torture, disappearances, 
## extrajudicial killing, etc). Look at the distribution of that variable by
## creating a bar plot below. 

#Create a bar plot for the distribution for physint_sum
ggplot(data = finalexam, aes(x=physint_sum)) + 
  geom_bar(stat = "count", width = 0.5, fill="steelblue") +
  labs(
    title = "Distribution of Physint_sum in Countries",
    x = "Physint_sum",
    y = "Number of Countries"
  )
theme(
  plot.title = element_text(size = 16, face = "bold",hjust = 0.5),
  axis.title.x = element_text(size = 12, face = "italic"),
  axis.title.y = element_text(size = 12, face = "italic"),
)


## Let's create an overall human rights variable by adding the physical
## integrity index to measures of empowerment rights (speech, religion, domestic movement)
## and measures of workers rights (right to form unions, bargain collectively.) 
## Use pipes and the mutate() function to create a variable called "human_rights". 
## To create that variable, add together the variables "physint_sum", "empowerment_rights"
## and "workers_rights". 

## Once again, make sure you are using pipes! 

#Create a variable called "human_rights"

finalexam <- finalexam %>%
  mutate(finalexam, human_rights = physint_sum + empowerment_rights + workers_rights )

select(finalexam, human_rights)

## Now look at a bar plot of your variable "human_rights". 

ggplot(data = finalexam, aes(x=human_rights)) + 
  geom_bar(stat = "count", width = 0.5, fill="steelblue") +
  labs(
    title = "Distribution of Human Rights in Countries",
    x = "Human Rights Numbers",
    y = "Score"
  )
theme(
  plot.title = element_text(size = 16, face = "bold",hjust = 0.5),
  axis.title.x = element_text(size = 12, face = "italic"),
  axis.title.y = element_text(size = 12, face = "italic"),
)



### Using the group_by() and summarize() functions, and pipes,
### look at the mean level of human rights per year in this data set. 
### (Once again using the human_rights variable that you just created.)
### The variable for year is "year". 
### Don't forget about the na.rm=T argument!

finalexam %>%
  group_by(year) %>%
  summarise(average_rights = mean(human_rights, na.rm=T))

select(finalexam, average_rights)



## What year had the lowest average level of protections for human rights
## across all countries? Which year had the highest? Answer in a comment.

# Answer:
# Across all the countries, the year with the lowest average level of protections
# was year 2019.  On the other hand, across all countries, the year with the 
# highest average level of protections was year 2017


## Using pipes and the filter() function, create a new data set that only
## includes observations from the year that had the lowest level
## of human rights protections. Call the data set
## whatever you'd like. 

finalexam2 <- finalexam %>%
  filter(year == 2019)


## Using the new data set that you just created, create
## a scatterplot of the relationship between human rights 
## ("human_rights" on the y-axis) and the level of democracy
## ("v2x_polyarchy" on the x-axis). Use the "jitter"
## position adjustment.

#Removed points that were missing values
ggplot(data = finalexam2, mapping = aes(x = v2x_polyarchy, y = human_rights)) +
  geom_point(na.rm=T) + geom_jitter(na.rm=T)

## Create the same figure again, but without the "jitter"
## position adjustment. 
## Overlay geom_smooth() with your scatter plot, using the
## same two variables. Add a title and change the 
## x and y labels to something more intuitive.

ggplot(data = finalexam2, mapping = aes(x = v2x_polyarchy, y = human_rights)) +
  geom_point(na.rm=T) + 
  geom_smooth(mapping = aes(x = v2x_polyarchy, y = human_rights)) +
    labs(
      title = "Distribution of Human Rights in Countries",
      x = "Electoral Democracy",
      y = "Human Rights Average"
      )
  theme(
    plot.title = element_text(size = 16, face = "bold",hjust = 0.5),
    axis.title.x = element_text(size = 12, face = "italic"),
    axis.title.y = element_text(size = 12, face = "italic"),
  )

## Based on your plot, how would you describe the relationship 
## between human rights and electoral democracy? 
## Answer in a comment.

# Answer:
# The relationship between human rights and electoral democracy:
# As Human Rights increases, Electoral Democracy increases.


## Let's add a third variable to this plot. 
## First, add the region variable by changing 
## the color of the points by the values of ""pol_region"
## and then create a new plot in which you facet 
## the plot by region using the variable "pol_region". 


# Plot with color of points depending on pol_region  
ggplot(data = finalexam2) +
  geom_point(mapping = aes(x = v2x_polyarchy, y = human_rights, color=pol_region), na.rm=T) + 
  geom_smooth(mapping = aes(x = v2x_polyarchy, y = human_rights), na.rm=T) +
  labs(
    title = "Distribution of Human Rights in Countries",
    x = "Electoral Democracy",
    y = "Human Rights Average"
  )
theme(
  plot.title = element_text(size = 16, face = "bold",hjust = 0.5),
  axis.title.x = element_text(size = 12, face = "italic"),
  axis.title.y = element_text(size = 12, face = "italic"),
)

#Plot with facet of pol_region
ggplot(data = finalexam2) +
  geom_point(mapping = aes(x = v2x_polyarchy, y = human_rights), na.rm=T) + 
  geom_smooth(mapping = aes(x = v2x_polyarchy, y = human_rights), na.rm=T) +
  facet_grid(pol_region~year)
  labs(
    title = "Distribution of Human Rights in Countries",
    x = "Electoral Democracy",
    y = "Human Rights Average"
  )
theme(
  plot.title = element_text(size = 16, face = "bold",hjust = 0.5),
  axis.title.x = element_text(size = 12, face = "italic"),
  axis.title.y = element_text(size = 12, face = "italic"),
)

## Now using the same data set that looks at only
## observations from a single year, look at the distribution
## of the variable "inflation". It ranges approximately 
## from -5 to 50. 
## If there are outliers in this variable, pull them
## out of the data set and tell me which countries 
## they correspond to in a comment. Make sure you are
## using pipes for all of this code!

ggplot(finalexam2) + 
  geom_histogram(mapping = aes(x = inflation), binwidth = 0.5)

outliers <- finalexam2 %>% 
  filter(inflation < -5 | inflation > 50) %>% 
  select(inflation, Country.Name) %>%
  arrange(Country.Name)

# There are outliers in Argentina and Sudan
# Argentina had an inflation of 53.5
# Sudan had an inflation of 51


## Now replace them with NAs. 

finalexam3 <- finalexam2 %>%
  mutate(inflation = ifelse(inflation < -5 | inflation > 50, NA, inflation))


## Using your new inflation variable, create a boxplot 
## looking at the relationship between "inflation" 
## (a continuous variable) and "pol_region" 
## (a categorical variable). 

ggplot(finalexam3, aes(x=pol_region, y=inflation)) + 
  geom_boxplot(outlier.colour="red", outlier.shape=8,
               outlier.size=4)

## Are your labels difficult to read? Switch the x and
## y axes by changing the coordinate system.

ggplot(finalexam3, aes(x=inflation, y=pol_region)) + 
  geom_boxplot(outlier.colour="red", outlier.shape=8,
               outlier.size=4)

## Which region has the largest range of values for 
## the variable inflation? Which has the smallest? 
## Answer in a comment. 

# The region with the largest range of values for the variable inflation
# is Sub-Saharan Africa.  This is true because that region has the largest box
# between all the other regions.


### Great work! That's it for your final exam.
## Please submit your code on Brightspace and thank you
## for a great semester! 

# Thank you! Was an interesting language to learn. Very similar to regular
# coding with studying in the Computer Science Major.

