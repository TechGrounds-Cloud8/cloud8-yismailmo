# import random
# number = random.randint(1, 10)       # Generate random number
# num_of_guesses = 1                   # Number of guesses player took
# guess = 0                            # Player's current guess
# # Introduce player to game
# print('Welcome to the number guessing game!')
# print('I have come up with a number between 1 and 10, guess what it is.')
# running = True
# while True:

#     try
#         while running:
#             guess = int(input("What is the number?:"))
#             num_of_guesses += 1
#         if num_of_guesses == 3:
#             print("you have reached the max")
#         if guess > number:
#             print('Too high, pls try again.')
#         elif guess < number:
#             print('Too low, pls try again.')
#         else:
#             print('Good job!')
#         print(f'It only took you {num_of_guesses} tries')
#         running = False # Exits out of while loop
# print('Thanks for playing!')

import random
# The random module provides access to functions and that it allows you to generate random numbers.
# used for a computer to pick a random number in a given range 

def instructions():
    print("Welcome to the guessing game you will have 3 tries to pick a number 1-10")
    print("Good luck btw it's all random")


instructions()
# guess limit so the user can't guess too much.

while True:
        try:
            guess_limit = 1
# The random guess
            number = random.randint(1, 100)
# What users can type and see. Randint
# in this case i want a random integer, so i  can use the randint function Randint 
# which accepts two parameters: a lowest and a highest number. 
            user = int(input("What is the number?: "))
            guess_limit += 1
# The while loop so it can go on.
            while user != number:

                if user > number:
                    print("Lower")

                elif user < number:
                    print("Higher")
        except: ValueError
        print('Invalid number, try again!')

    
        if guess_limit == 5:
            print("------------------------------------------------------")
        print("You ran out of guess ;( the answer was", number, "<--")
        print("------------------------------------------------------")
        break
else:
    print("You guessed it right! The number is", number,
          "and it only took you ", guess_limit, "tries")
