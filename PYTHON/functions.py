# Ex 1
import random
for i in range(5):
   print (random.randint(0, 100))

# i means the iteration(process of repeating)

# Ex 2
def myfunction():
    print("Hello, " + "Yassin! ")
    myfunction()

def myfunction():
    name = "Ismail"
    print("Hello, " + name + "!")
myfunction();    


# Ex 3

def avg(x,y):
    return (x + y) / 2

x = 128
y = 255
z = avg(x,y)
print ("The average of" ,x, "and" , y, "is", z)
