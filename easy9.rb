#https://launchschool.com/exercises/02350925

#Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

#You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.


=begin

****Restate the question****
- Write a method that takes 2 ints as args.The first integer will be the count that we go by, and the second will be the first number 
  of the sequence. The method will return the same name number of args as our count (first arg), and the values will be the multiples of the second number. 

****Explicit Reqs****
- Input: two ints 
- Output: An array of ints 
- The count (first arg) will be >=0 
- Starting number can be any integer (neg or pos)
- If count is 0 then return an empty arry 

****Implicit Reqs****
- Multiples start by adding the number that we're given and we continue to do that until we reach the count
- Return a new array 

****Mental Model****
- We're given two numbers, a count which gives us the total number of integers our array will have, and we're also given the first number that the collection will start with. We need to grab the first number that our collection starts with and continue to add it by itself until we get to the end of the count 

****Algo****
1. Receive the two numbers 
2. Grab the first number and thatll be our length 
3. Grab the 2nd number and itll be starting number 
4. Add that number to a new collection 
5. Add that number by itself and store it as our new  number 
6. Repeat until we get to the count 
=end 

def sequence(number1, number2)
  length = number1
  number_to_increase_by = 0 
  arr = []
  return arr if number1 == 0 

  loop do 
    arr << number_to_increase_by += number2
    break if arr.length == number1 
  end 
  p arr 
end 

sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []