import random

# first step i would like my users to recieve an instruction on how to play the game
def instruction():
    print("Hello welcome to the random game")
    print("You will have 5 tries to guess the correct random number between 1-100")

instruction()

number = random.randint(1, 100)

user_guess = 1
while True:
    try:
        user_input = int(input("what is the number? "))
        if user_input < number:
            print("Higher")
        elif user_input > number:
            print("Lower")
        elif user_guess == 5:
            print("You ran out of guess, the answer was", number, "<--")
        else:
            print("You guessed it right, the number is ", number, "and it only took you", user_guess, "tries") 
            break


    except ValueError:    
        print("Just numbers allowed")

# user_guess  += 1
   
#     if user_input != number:
#         print("please enter a number only")
       
#     try
#         if user_input < number:
#             print("Higher")
#         elif user_input > number:
#             print("Lower")
#          if user_guess == 5
#         print("You ran out of guess, the answer was", number, "<--"")
#         break

#     except:
#         print("an error occured")
#     else
#     print("You guessed it right, the number is ", number, "and it only took you", user_guess, "tries")    





