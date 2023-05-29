

###############################################################################
######   Homework Assignment Week 12: Uploading data
######   Please make sure your name is in the filename before the .R extension
######   Write your code below each prompt below.
###############################################################################

##### STUDENT NAME: Jalen Mendoza

## Navigate to the Correlates of War project website and download
## the Militarized Interstate Disputes data:
## https://correlatesofwar.org/data-sets/mids/
## You're looking for the heading "MID-Level and Incident-Level Data 5.0"
## and under that, "MID 5 Data and Supporting Materials.zip"
## Once you've downloaded the zip file, open it and load one of
## the .dta files into your global environment. 


## Copy and paste the code that loads the data set into 
## your global environment here: 

library(tidyverse)
library(haven)
MIDA_5_0 <- read_dta("MID-5-Data-and-Supporting-Materials/MIDA 5.0.dta")
View(MIDA_5_0)

## Turn your data set into a tibble. Give it a name.

MIDA_5_0 <- as_tibble(MIDA_5_0)

## Print the first 10 rows of your tibble, and all 
## of the variables. 

#First 10 rows and all the columns(variables)
print(MIDA_5_0, 10, width = Inf)


## Subset the data in two different ways. Choose the
## third column. 


third_column <- MIDA_5_0[3]
View(third_column)

third_column2 <- MIDA_5_0["stmon"]
View(third_column2)



