##############################################################################
######   INTRODUCTION TO R SYNTAX
######   The file extension for this worksheet will be .R 
##############################################################################


####### STUDENT NAME: Jalen Mendoza


####### Let's start with mathematical equations. If I want to know what 2+2 is, I can
####### write it here and execute the code to get an answer. For example: 

2+2  

####### Let's write our first line of code! Mathematical order of operations works 
####### the same way in R as it does in your math classes.  You saw how we do addition 
####### above, using "+" .  Subtraction uses a "-", multiplication uses "*", and division 
####### uses "/". In space below, calculate the result of this equation: 
####### Ten times four plus eight divided by two. 

(10*4)+(8/2)

####### Notice that I am writing all of these 
####### instructions using a pound sign (#).  Using one or more pound signs before 
####### text creates a "comment" which is a note within an R code chunk that I do 
####### not want R to execute. They are useful when we want to remind ourselves 
####### why we wrote code a certain way. 

####### Now let's move onto variables.
####### A variable is an object that allows us to store one piece of information.  
####### We can give variables any names as long as the name consists of letters A through Z,
####### (upper or lowercase), numbers, an underscore "_" or a period "."
####### A letter must always be first. 

number <- 2
another_number <- 4

####### Note that both variables have appeared
####### in  your environment in the top right pane. This means that those variable names
####### and their contents are in R's memory. Watch what happens when we use basic addition
####### using these variables:

number + another_number

####### Now try it yourself! In the space below, create three variables and 
####### assign different numbers to each variable. Name the variables whatever you want. 
####### Then write an equation using the three variables. Execute that code. 

#Created three variables
a <- 20
b <- 4
c <- 3

#Did addition arithmetic and should get 27
a + b + c

####### Functions are 'objects' that perform a specific task. 
####### To use the proper terminology, we "call" a function by writing the name of the 
####### function and following it with opening and closing parentheses. 
####### To use the print function, we type print() with the name of
####### the variable between the parentheses.  Execute this code: 

print(number)
print(another_number)

####### Note that if I try to print a variable that doesn't exist yet, I will get
####### an error message:

print(banana)

####### Now let's create a variable "banana" by executing this:

banana <- 321 
print(banana)

####### So if you get a similar error, check to make sure you executed the 
####### to create the variables you are using!

####### Now let's move onto data types. Data types are the classifications that 
####### we give to difference pieces of information. There are many different data 
####### types, but in this class, we will talk about: Numeric, Character, Vector, 
####### logical, and NA. Thus far we have only used numeric data which is any number. 
####### Characters can be any numbers and characters 
####### on the keyboard. Characters are surrounded by a single or double quote, like:

Hello_Variable <- 'Hello, I am a single-quote character string!'
Hello_Variable2 <- "Hello, I am a double-quote character string!"

####### Execute the code above. It creates two variables called "Hello_Variable" and
####### "Hello_Variable2".  Let's look at the contents of the first variable:

print(Hello_Variable)

####### Good. Now write code to look at the contents of the second variable below: 

print(Hello_Variable2)

####### If you want to know what type of data you have in your variable, you
####### can use the class function.  Let's look at the variables that we created 
####### earlier: 

class(another_number)
class(Hello_Variable)

####### Notice that we use the class() function the same way we use the print()
####### function. Because the name of the function is different, (class and not print),
####### the function performs a different task on the variable within the parentheses.
####### If you executed the code above, you'll see that another_number is numeric and 
####### Hello_Variable is a character.  Interestingly, even numbers in quotes will
####### be read as characters. This means that numbers in quotes cannot be used for
####### addition, subtraction or anything else that you do with a number. 
####### For example: 

one <- "1"
two <- "2"

one+two

####### This should give you an error. But, if we reassign values WITHOUT the 
####### quotes, the variables will be numeric: 

one <- 1 
two <- 2

one+two

####### This is another useful feature of variables. We can always reassign
####### values after we have created the variable. 

####### Now to get a little extra practice, create at least two character-type
####### variables and two numeric-type variables. Name them whatever you want. 
####### Then use class() to check the variable type, and use print()
####### to see each variable's content.

## Create your variables below:

first_name <- "Jalen"
last_name <- "Mendoza"
birth_month <- 2
birth_day <- 27

class(first_name)
class(last_name)
class(birth_month)
class(birth_day)

print(first_name)
print(last_name)
print(birth_month)
print(birth_day)

####### Excellent! Onto vectors. A vector is a list of data that is the same 
####### type.  It is surrounded by parentheses and the letter 'c', which is the 
####### "combine" function: c().  Each value in the combine function needs to 
####### be separated by a comma.

Coffee_Vector <- c('I','could','really','use','a','coffee','right','now')

####### In this vector, each word is its own individual element. It has 
####### eight elements. This is different from this vector which only has 
####### one element:

Long_Coffee_Vector <- c('I could really use a coffee right now')

####### Or two elements:

Medium_Coffee_Vector <- c('I could really', 'use a coffee right now')

####### You can also create numeric vectors: 

First_Numberic_Vector <- c(4,64,32,100)

Second_Numberic_Vector <- c(464,32100)

####### We can check the number of elements in a vector by using the
####### length() function.  Let's try it on the variables 
####### Coffee_Vector, Long_Coffee_Vector, and Medium_Coffee_Vector. 
####### Somewhere in the space below, write a comment with the 
####### length (number of elements) in each vector.

length(Coffee_Vector)
length(Long_Coffee_Vector)
length(Medium_Coffee_Vector)

####### If you ever want additional information about a function, 
####### like the length() function, you can type the name of the 
####### function inside the help() function like so:

help(length)

####### Below use the length() function to check the number of 
####### elements in the variables First_Numberic_Vector and Second_Numberic_Vector.

length(First_Numberic_Vector)
length(Second_Numberic_Vector)

####### Let's get a little more practice.  Below, create a variable
####### with any name that you want. In the variable, store the current
####### year (2023) as a numeric-type variable. Then create a new
####### variable with any name that you want. 
####### Store the year in that variable, but this time as a character-type.
####### Now, use the class() function on both variables to make sure that
####### the first variable is numeric-type and the second is character-type. 

random_var1 <- 2023
random_var2 <- "2023"

class(random_var1)
class(random_var2)

####### Now create two numeric vectors that have the same number of elements. 
####### They must have at least 2 elements. Assign them to variables and name
####### the variables whatever you like.  Now, add these two variables together
####### and see what happens. Do this below. 

vector1 <- c(1,2)
vector2 <- c(3,4)

##### Good work! 

##### So far, the most important separator we've learned are  parentheses.
##### We primarily use them to execute functions.
##### One other useful separator is the square bracket: [ ]
##### We can use the square bracket to access individual elements in a vector.  
##### For example, execute this code to create the vector variable "practice_1".

practice_1 <- c(54,23,33,933,10,2,44,245,2,1,556,7,5,332)

##### You can access the 1st and 5th element of this vector using brackets: 

practice_1[1]
practice_1[5]

##### To practice this, create a vector variable with 10 elements. 
##### Then use square brackets to find 3rd and 9th elements of the vector variable.

practice_2 <- c(1,2,3,4,5,6,7,8,9,10)
practice_2[3]
practice_2[9]

##### Our final lesson for this assignment! 
##### In R, we can compare values using comparative operators. They include: 

#####        Less than: <
#####        Greater than: >
#####        Less than or equal to: <=
#####        Greater than or equal: to >=
#####        Is equal to: ==
#####        Is not equal to: != 

##### For example, if we want to know if 100 is greater than 1, we can write: 

100>1

99==101

##### Run the code above. You'll see that these evaluates as TRUE 
##### (this is the logical data type that I have mentioned previously). 
##### Let's practice a few of these.  
##### In the space provided below, practice using these comparative 
##### operators by testing whether: 

#####        1) 45 is equal to 45
#####        2) 53 is greater than or equal to 2
#####        3) 88 is not equal to 99
#####        4) 100 is less than 3

##### Write code for each and execute it below.

45==45
53>=2
88!=99
100<3

######################################################################
######################################################################
##### That's all you're required to know for this assignment! 
##### If you have finished the work above, you should move 
##### onto the work below. It's a bit more challenging, and not necessary.
##### I am including it for those of you who are having an easy time with 
##### these worksheets.
######################################################################
######################################################################


##### Now we're going to use these operators to write conditional statements.
##### In R, we can execute a task based on a set of conditions.  
##### For example, we can write: 

if(TRUE){
  print("This is true!")
}

#####  (Run the code above to see what happens.) 
##### Note that the condition goes in the parentheses after "if" 
##### and the task that we want to perform goes in the brackets.  
##### It's very important to write these conditional statements with 
##### this exact syntax.  We can use our comparative operators as well.  
##### Try running this and see what happens: 

if(200>100){
  print("Yes!")
} else {
  print("No!")
}

##### Note that we added a new line: "else" allows us to run a task 
##### if the first condition is NOT true. Try writing one below.  
##### Write a conditional statement in which you evaluate whether 
##### 50 is equal to 34. If it is true, print "Rhode Island". 
##### If it is false, print "Kingston".  For now, it might be 
##### helpful to copy and paste the syntax below and then alter it. 
##### But that's up to you. 

## Write your conditional statement below

if(50==34){
  print("Rhode Island")
} else {
  print("Kingston")
}

##### These conditional statements can be changed to do any 
##### number of things.  We have only covered a few basic 
##### functions of R, so our repertoire is fairly limited. 
##### For example, we can create a conditional based on the class of our data. 

### Create a variable that has data type "character"

NewVariable <- "Recitation"

if(class(NewVariable)=="character"){
  print("This is a character")
} else{
  print("This is NOT a character")
}

##### Try to create a conditional statement like this below. 
##### Create a variable that is numeric type.  
##### Then create a conditional statement that prints one thing if
##### it's numeric, and someone else if it's a character. 

NewVariable2 <- 1

if(class(NewVariable2)=="numeric"){
  print("This is a number")
} else{
  print("This is NOT a number")
}

##### We  can also use logical operators "and" (&) "or" (|) and "not" (!). 
##### When we use the "and" operator, we are testing whether two conditions 
##### are both true.  For example: 

Assignment <- "Midterm Exam"
InMarch <- TRUE

if(Assignment == "Midterm Exam" &
   InMarch==TRUE){
  print("You should study!")
}else{
  (print("You should take a break!"))
}

##### As always, run the code above and see what happens.  
##### Next, use the two variables I created below to test whether the variable 
##### Temperature is less than 50 OR whether the variable Windy is TRUE.  
##### Remember that the "or" operator is "|". If one OR the other conditions
##### is true, print "Wear a coat!" If neither is true, print "You don't need a coat!"
##### Make sure you run the code that creates the variables first. 

Temperature <- 40
Windy <- FALSE

## Write your conditional statement below.

if(Temperature < 50 | Windy==TRUE){
  print("Wear a coat!")
} else{
  print("You don't need a coat!")
}

