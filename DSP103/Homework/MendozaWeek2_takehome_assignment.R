###############################################################################
######   INTRODUCTION TO R SYNTAX HOMEWORK
######   The file extension for this worksheet will be .R 
######   Please make sure your name is in the filename before the .R extension
######   Write your code below each prompt below.
###############################################################################

## Let's do some basic math. Choosing your own numbers, write code to demonstrate:

## Addition
6+6

## Multiplication
6*6

## Division
6/6

###################################
####### Variables and basic functions
###################################

## Assign three different values to three different variables.
## Two of your variables should be numeric and one should be character type
a <- 6
b <- 2
name <- "Jalen"


## Use the numeric variables in an expression 
## (ie do addition, subtraction, etc with your variable)
a+b

## Execute the print function on one of your variables.
print(name)

## Execute the class function on one of your numeric variable and your 
## character variable. 
class(a)
class(name)

###################################
####### Vectors
###################################


## Create two vector variables (numeric type) using the combine function.
## Put 5 elements in each of your two variables.
vector1 <- c(1,2,3,4,5)
vector2 <- c(6,7,8,9,10)

##  Perform a basic mathematical equation on your two vectors.
vector1 + vector2

## Run this line of code:

New_Variable_23 <- c("1","2","3","4","5")

## Add the variable "New_Variable_23" to one of the vector variables that you created above.
## In a comment below, explain why you received an error. 

vector1[0] + New_Variable_23[0]

# We receive an error because we are adding a non-numeric type to a numeric type.
# New_Variable_23 has all "character" type

## Index a single element from one of your vector variables.
vector1[0]


## Run this line of code:

class(New_Variabl_23)


## Explain in a comment why you received an error. 

# We recieve an error because the variable is misspelled


###################################
####### Comparative operators
###################################


## Write code to evaluate the following expressions: 

#### seven is greater than forty
#### six is not equal to six
#### three is greater than or equal to seventy

7>40
6!=6
3>=70
