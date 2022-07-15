import random

moves_list1 = ["rock","paper","scissor"]
moves_list2 = ['r','p','s']

cpu_score = 0
player_score = 0
max_score = 5

# Function to check if the input of the player is valid.
def standardise_move(player_input):
    if player_input.lower() in moves_list1:
        return player_input.lower()
    elif player_input.lower() in moves_list2:
        index = moves_list2.index(player_input)
        return moves_list1[index]

def valid_check(standard_move):
    if standard_move in moves_list1:
        return True
    else:
        return False

def cpu_input():
    cpu_input = random.choice(moves_list1)
    return cpu_input

def score(player_score, cpu_score, winner):
    if winner == "player":
        player_score = player_score + 1
    elif winner == "cpu":
        cpu_score = cpu_score +1
    return player_score, cpu_score

def win_condition(player_move, cpu_move):
    if player_move == cpu_move:
        print("It's a tie!")
    elif player_move == "rock" and cpu_move == "scissor":
        print("You win!")
        return 'player'
    elif player_move == "paper" and cpu_move == "rock":
        print("You win!")
        return "player"
    elif player_move == "scissor" and cpu_move == "paper":
        print("You win!")
        return "player"
    else:
        print("You lose!")
        return "cpu"
        

# while input is valid and max score is not exceeded
while player_score < max_score and cpu_score < max_score:
    player_move = input("Choose Rock(r), Paper(p) or Scissor(s):")
    if valid_check(standardise_move(player_move)) == True:
        cpu_move = cpu_input()
        print("Computer chose:" + cpu_move)
        winner = win_condition(standardise_move(player_move), cpu_move)
        player_score, cpu_score = score(player_score, cpu_score, winner)
        print("Your score:", player_score, ". Computer's score:", cpu_score, ".")
    else:
        print("This input was invalid! Try again.")

if player_score > cpu_score:
    print("You won! Congratulations!")
else:
    print("You lost! Get rekt by the system.")