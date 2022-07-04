board = ['-', '-', '-',
         '-', '-', '-',
         '-', '-', '-']
gameplay = [1, 0, 1, 0, 1, 0, 1, 0, 1]
def display_board():
    print(board[0] + '|' + board[1] + '|' + board[2])
    print(board[3] + '|' + board[4] + '|' + board[5])
    print(board[6] + '|' + board[7] + '|' + board[8])

def win_check():
    # Row Check
    for col in range(7):
        if board[col] is board[col+1] is board[col+2] == 'X':
            print('You win')
            return True
        if board[col] is board[col+1] is board[col+2] == 'O':
            print('You win')
            return True

    # Column Check
    for row in range(3):
        if board[row] is board[row+3] is board[row+6] == 'X':
            print('You win')
            return True
        if board[row] is board[row+3] is board[row+6] == 'O':
            print('You win')
            return True

    # Diagonal Check
    dia = 0
    if board[dia] is board[dia+4] is board[dia+8] == 'X':
        print('You win')
        display_board()
        return True
    elif board[dia] is board[dia+4] is board[dia+8] == 'O':
        print('You win')
        display_board()
        return True
    dia = 2
    if board[dia] is board[dia+2] is board[dia+4] == 'X':
        print('You win')
        display_board()
        return True
    elif board[dia] is board[dia+2] is board[dia+4] == 'O':
        print('You win')
        display_board()
        return True

def play_game():
    i = 0
    if gameplay[i] == 1:
        board[val] = 'X'
        gameplay.pop(i)
        res = win_check()
        if res is True:
            return True
        else:
            display_board()
            inval()
    else:
        board[val] = 'O'
        gameplay.pop(i)
        res = win_check()
        if res is True:
            return True
        else:
            display_board()
            inval()


def inval():
    global val
    val = int(input('Choose the values from 0 to 8'))
    try:
        if val<=8 and val>=0:
            for item in range(9):
                if item == val:
                    res = play_game()
                    if res is True:
                        break
                    break
        else:
            print('Enter Valid Input!!!!')
            inval()

    except TypeError:
        print('Enter Valid Input!!!!')
        inval()



display_board()
inval()