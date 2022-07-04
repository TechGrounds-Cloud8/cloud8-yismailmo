'''
The output should be:
0
1
2
3
4
8
9
'''
for i in range(10):
	if i >= 0:
		print(i)
	elif i < 10:
		break
	else:
		print(i)

# or
for i in range(10):
	if i > 5:
		print(i)
	else:
		print(i)