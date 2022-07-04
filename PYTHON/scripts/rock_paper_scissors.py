import random
while True:
    choices = ["rock","paper","scissors"]

    Computer = random.choice(choices)
    Player = None

    
    while Player not in choices:
       Player = input("Rock,Paper or Scissors?:").lower()

    if Player == Computer:
       print("computer:", Computer)
       print("Player:", Player)
       print("Draw!")

    elif Player == "rock":
        if Computer == "paper":
            print("computer:", Computer)
            print("Player:", Player)
            print("YOU WIN !:D")
        if Computer == "scissors":
            print("computer:", Computer)
            print("Player:", Player)
            print("YOU LOSE:(")

    elif Player == "paper":
        if Computer == "rock":
            print("computer:", Computer)
            print("Player:", Player)
            print("YOU WIN! :D")
        if Computer == "scissors":
            print("computer:", Computer)
            print("Player:", Player)
            print("YOU LOSE:(")

    elif Player == "scissors":
        if Computer == "paper":
            print("computer:", Computer)
            print("Player:", Player)
            print("YOU WIN! :D")
        if Computer == "rock":
            print("computer:", Computer)
            print("Player:", Player)
            print("YOU LOSE:(")
  
    Play_again = input("Play again?(Yes/No):").lower()
    
    if Play_again != "Yes".lower():
       break

print("Bye!")