This is my cheat sheet


# Getting help ------------------------------------------------------------

Accessing the help files

?mean
## Get help of a particular function

help.search("weighted mean")
## search the help files for a word or phrase

About an object

str(iris)
## Get a summary of an obkext's structure

class(iris)
## find the class an objectc belongs to.


# Vectors -----------------------------------------------------------------

Creating vectors

c(2, 4, 6) - join elements into a vector

2:6 - An integer sequence

Vector functions

sort (x) - return x sorted

table (x) - see count of value

rev (x) - Return x reversed

unique (x) - see unique values
  
By Position

X[4] - The fourth element

X[-4] - All but the fourth element

X[2:4] - Elements 2- 4

X[-(2:4)] - All elements except 2 - 4

X[c(1, 5)]- Elements one and five

By Value

X[X == 10] - Elements which are equal to 10

X[X < 0] - All elements less than 0)

x[x %in% c(1, 2, 5)] - elements in the set 1, 2, 5

Named vectors

x["apple"] - element with name apple

# Programming -------------------------------------------------------------

FOR LOOP

for (variable in sequenace){
  do something
}

While Loop

while(condition){
  Do something
}

If Statements

if (condition){
  do soemthing
} else
  Do something different
}

Functions

function_name <- functions(var){
  do somehting
  return(new var)
}

Conditions

== - equal 
!= - not equal
>= - greater than or equal to
> greater than
<= - less than or equal to
< less than
| or
!- not
%in%- in the set

# Strings -----------------------------------------------------------------

paste(x, y, sep = ' ') - join multiple secors together

paste(x, collapes = ' ') join elements of a vector together

factor(x) - turn a vecto into a factor
