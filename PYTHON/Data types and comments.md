# Data types and comments


Under the hood, a computer can only see strings of zeros and ones. Programming languages make use of data types to tell the computer how to interpret those strings.
For example, when the computer needs to read the binary string 01000001, it will need to know the data type to determine whether it means 65 or “A”.

This is a non exhaustive list of some important data types in Python:

**Boolean**
A binary state that is either True or False.
boolean = True

**string**

Technically an array of characters. Strings are denoted using “ ” double quotes or ‘ ’ single quotes.

string = "This is a string"

**int**

An integer is a whole number. Ints can be both positive and negative.

integer = 6

**float**

A floating-point number is a decimal number.
floating_point = 18.5


Comments are lines that do not get processed as code. This can be used for multiple purposes. For example, you can write a short description of what a block of code does. You can also ‘comment out’ some code, so that it is temporarily removed. This can be useful for testing and debugging.


### Exercise 1:
Create a new script.

    Copy the code below into your script.
    a = 'int'
    b = 7
    c = False
    d = "18.5"

Determine the data types of all four variables (a, b, c, d) using a built in function.

Make a new variable x and give it the value b + d. Print the value of x. This will raise an error. Fix it so that print(x) prints a float.
Write a comment above every line of code that tells the reader what is going on in your script.

```Python
# Exercise 1

# since b is an integer, and d is valued as a string. 
# so I have to change it to a float(using casting) in order to add b and d
# c is a boolean and a is a string
x = ((b) +float(d))
print (x)


```


### Exercise 2:
Create a new script.
Use the input() function to get input from the user. Store that input in a variable.
Find out what data type the output of input() is. See if it is different for different kinds of input (numbers, words, etc.).

```Python

# Exercise 2

username = input("Enter username")
print("Username is: " + username)

# OR this code

user_input = input()
print(type(user_input))

# After running the code I could still give the input as an integer or a string.




```
# source

https://www.w3schools.com/python/python_user_input.asp
