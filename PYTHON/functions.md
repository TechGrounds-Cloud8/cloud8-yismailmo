# Functions

A function is a block of code that only runs when it is called. Functions are recognizable by the brackets () next to the function name. These brackets serve as a place to input data into a function.
Functions can return data as a result.

Besides the built-in functions, you can also write custom functions, or import functions from a library or package.

### Exercise 1:
Create a new script.

Import the random package.

Print 5 random integers with a value between 0 and 100.
```python
import random
for i in range(5):
    print (random.randint(0, 100))

# i means the iteration(process of repeating)
# The randint() method returns an integer number selected element from the specified range.
#output:
18
90
30
65
26
```


### Exercise 2:
Create a new script.

Write a custom function myfunction() that prints “Hello, world!” to the terminal. Call myfunction.

```python

def myfunction():
    print("Hello, " + "Yassin! ")
    myfunction()

```
Rewrite your function so that it takes a string as an argument. Then, it should print 

    “Hello, <string>!”.



```python

def myfunction():
    name = "Ismail"
    print("Hello, " + name + "!")
myfunction();  

```
### Exercise 3:
Create a new script.
Copy the code below into your script.

    def avg():
    # write your code here
 
    x = 128
    y = 255
    z = avg(x,y)

    print ("The average of",x,"and", y, "is", z)


Write the custom function avg() so that it returns the average of the given parameters.

```python

def avg(x,y):
    return (x + y) / 2

x = 128
y = 255
z = avg(x,y)
print ("The average of",x,"and", y, "is", z)


# output:
The average of 128 and 255 is 191.5
```
### Source

https://www.w3schools.com/python/ref_random_randint.asp