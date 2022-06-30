
#names = ["Casper", "Coen", "Kim Sing", "Achraf", "Clyde" ]
#for n in names:
    #print(n)




numbers_list = [9, 80, 16, 67, 35]

for n in range(len(numbers_list)):
    if n == len(numbers_list)-1:
        print(numbers_list[n] + numbers_list[0])
    else:
        print(numbers_list[n] + numbers_list[n+1])

