import math
import time

def sumPalindrome(m):
	startT = time.time()
	sumP = 0
	if(m < 10):
		endT = time.time()
		print(endT-startT)
		return sumP
	
	i = 10
	while(i<m):
		#dToNext = DistToNextPal(i)
		nextP = NextPalindrome(i)
		dToNext = nextP - i
		#print(dToNext)
		if(m<nextP):
			d = nextP - m #Distance to the maximum positive integer.
			s = sum([x for x in range(dToNext-d-1,dToNext+1)]) #Sum all distances to the end
		else:
			s = sum([x for x in range(1,dToNext+1)]) #Sum all distances to the next Palindrome
		sumP = sumP + s #Update the sum
		i = i + dToNext + 1 #Increment to the value 1 after the next Palindrome
	endT = time.time()
	print("It took %f seconds" % (endT-startT))
	return sumP

def num2digits(num): # Convert an integer into its base-10 digit representation
	digits = [];
	while (math.floor(num) > 0):
		digits.append(math.floor(num%10))
		num = num/10
		
	return digits[::-1]
	
def isPalindromic(digits):
	n = len(digits)
	if(n%2 == 0): #The even case
		for i in range(int(n/2)):
			if(digits[i] != digits[n-i-1]):
				return False
		return True
	else: #The odd case
		for i in range(int((n-1)/2)):
			if(digits[i] != digits[n-i-1]):
				return False
		return True
		
def NextPalindrome(P):
	currentP = num2digits(P)
	n = len(currentP)
	if(P<9): #For integers less than 9 the next Palindrome is the next number
		return P+1
	elif(sum([x == 9 for x in currentP]) == n): #For an integer made of 9's only, the next Palindrome is two integers away
		return P+2
	else:
		nextP = nextPal(currentP) #Call a function that returns the next Palindrome for other cases
		sumP = 0
		for i in range(n): #Convert from digits to an integer representation
			sumP = sumP + nextP[n-i-1]*pow(10,i)
		return sumP

def nextPal(currentP): #Used by NextPalindrome to find the next Palindrome for other cases
	n = len(currentP)
	if(n%2 == 0): #The even case
		j = int(n/2)
		left = currentP[0:j] #The left part of the digits list
		right = currentP[j:n] #The right part of the digits list
		l = j-1 #index of left part
		r = 0 #index of right part
		while(l>=0):
			if(right[r] > left[l]):
				t=j-1 #A dummy index
				while(t>=0):
					if(left[t]+1 > 9):
						left[t] = 0
						t = t-1 #Assuming it won't get to 0 because left(l) cannot be 9 and be less than right(r)  
					else:
						left[t] = left[t] + 1
						break
				return left + left[::-1]
			elif(right[r] < left[l]):
				return left + left[::-1]
			else: #If the two terms are the same ignore and move to the next in the respective lists.
				l = l - 1
				r = r + 1
				if(l < 0): #If reached end of lists then this is a Palindromic integer with no 9's,
					t = j-1 # so increment the last element of the left part and carry out if necessary.
					while(t>=0):
						if(left[t]+1 > 9):
							left[t] = 0
							t = t-1
						else:
							left[t] = left[t] + 1
							break
					return left + left[::-1]
	else: #The odd case
		j = int((n-1)/2)
		left = currentP[0:j+1] #The left part of the digits part
		right = currentP[j+1:n] #The right part of the digits part
		l = j-1
		r = 0
		while(l>=0):
			if(right[r] > left[l]):
				t=j #Dummy index for the left part, including the odd term.
				while(t>=0):
					if(left[t]+1 > 9):
						left[t] = 0
						t = t-1
					else:
						left[t] = left[t] + 1
						break
				return left[0:j] + left[::-1]
			elif(right[r] < left[l]):
				return left[0:j] + left[::-1]
			else:
				l = l - 1 
				r = r + 1 
				if(l<0):
					t=j #Dummy index for the left part, including the odd term.
					while(t>=0):
						if(left[t]+1 > 9):
							left[t] = 0
							t = t-1
						else:
							left[t] = left[t] + 1
							break
					return left[0:j] + left[::-1]
					
def DistToNextPal(P):
	return NextPalindrome(P) - P