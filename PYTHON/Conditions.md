# Conditions

Very often, you will want to run a piece of code only when certain conditions are met. For example, you might want to write something to an error log only if an error occurred.
Python makes use of the if, elif, and else statements.


### Exercise 1:

Create a new script.

Use the input() function to ask the user of your script for their name. If the name they input is your name, print a personalized welcome message. If not, print a different personalized message.
Example output:

```Python

name = input("please type your name: ")

if name == "Yassin": # this name is Caps sensitive, so only the first letter in capital will be accepted
    print("Hello, Welcome on board " "Yassin!" )
else:
    print("You are " + name + ", " + "not Yassin. Please leave.")

```    



### Exercise 2:
Create a new script.

Ask the user of your script for a number. Give them a response based on whether the number is higher than, lower than, or equal to 100.
Example output:

```python

number = int(input("please insert a number"))
if number < 100:
        print (number, "is pretty low, " + "isn't it")
elif number == 100:
        print(number,  "is a nice number indeed")
else:
        print("wow, ",  + number,  "is a big number! ")

```    
Make the game repeat until the user inputs 100.

### Source

https://www.w3schools.com/python/python_conditions.asp

