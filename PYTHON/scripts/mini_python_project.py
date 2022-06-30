
import random
# The random module provides access to functions and that it allows you to generate random numbers.
# used for a computer to pick a random number in a given range 

def instructions():
    print("Welcome to the guessing game you will have 3 tries to pick a number 1-10")
    print("Good luck btw it's all random")


instructions()
# guess limit so the user can't guess too much.
guess_limit = 1
# The random guess
number = random.randint(1, 100)
# What users can type and see. Randint
# in this case i want a random integer, so i  can use the randint function Randint 
# which accepts two parameters: a lowest and a highest number. 
user = int(input("What is the number?: "))
# The while loop so it can go on.
while user != number:

    if user > number:
        print("Lower")

    elif user < number:
        print("Higher")

    user = int(input("What is the number?: "))
    guess_limit += 1
    if guess_limit == 5:
        print("------------------------------------------------------")
        print("You ran out of guess ;( the answer was", number, "<--")
        print("------------------------------------------------------")
        break
else:
    print("You guessed it right! The number is", number,
          "and it only took you ", guess_limit, "tries")





