# // Exclusive Or
# // The || operator returns a truthy value if either or both of its operands are truthy. If both operands are falsey, it returns a falsey value. The && operator returns a truthy value if both of its operands are truthy, and a falsey value if either operand is falsey. This works great until you need only one of two conditions to be truthy, the so-called exclusive or.

# // In this exercise, you will write a method named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise. Note that we are looking for a boolean result instead of a truthy/falsy value as returned by || and &&.
=begin
Pedac

Problem
-write a method that returns a boolean -true or false
-the method takes 2 arguments
-the method returns true if exactly one argument is truthy
-otherwise it returns false

Examples
xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false

Data structures
input-boolean
output-boolean

Algorithm
-look at both arguments
-if the first argument is true but the second argument is false,
 the method will return true
-if the first argument is false but the second argument is true 
 the method will return true
-otherwise, the method will return false

Code
=end
def xor?(arg1, arg2)
  (arg1 == true && arg2 == false) || (arg1 == false && arg2 == true)
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

=begin Odd lists, Easy 3
Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.
=end

# oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# oddities(['abc', 'def']) == ['abc']
# oddities([123]) == [123]
# oddities([]) == []
# oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

=begin pedac

*************Problem***************************
Overall goal: return an array with elements at even index positions
initial input: array
overall output: array

explicit requirements:
write a method names oddieties, takes one parameter


implicit requirements:
empty array returns an empty Array
single element array will return the single element
elements in array can be integers or strings

questions:
do we return the same array or a new array?

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
  returns 2,4,6 because they are at index positions 0,2,4
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
  returns 1,3,5 because they are at index positions 0,2,4
oddities(['abc', 'def']) == ['abc']
  return only first item at index position 0
oddities([123]) == [123]
  return only first item at index position 0
oddities([]) == []
  empty array returns empty array
oddities([1, 2, 3, 4, 1]) == [1, 3, 1]
  returns 1,3,1 because at index position 0,2,4

*************Data Structure********************
++the steps the data takes in between input 
++and output listed above
array > array

************Algorithm*************************
high level
given an Array
initialize an empty result_array
iterate over each item and index with each_with_index
  if the index is even, add to result_array
return result_array

=end

def oddities(array)
  result_array = []
  array.each_with_index do |element, index|
    if index.even?
      result_array << element
    end 
  end 
  result_array

end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]


=begin palindromic strings part 2
Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.
real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false
=end

=begin pedac

*************Problem***************************
Overall goal: return true if string is a palindrome, false otherwise
initial input: string
overall output: boolean

explicit requirements:
check if string is a palindrome
case insensitive- ignore case, so A would == a 
ignore all alpha numeric characters such as ' or a ,
method return true if string is a palindrome
  return false if string is NOT a palindrome

implicit requirements:
string can contain letters and numbers and non alphanumeric chars

questions:

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:
real_palindrome?('madam') == true
  because madam  is the same as madam
real_palindrome?('Madam') == true           # (case does not matter)
  because Madam is the same thing as madaM
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter) because "madA m'I ,madaM" is returned 

real_palindrome?('356653') == true
  because returns 356653
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false
  because return 123ba321

*************Data Structure********************
++the steps the data takes in between input 
++and output listed above
string > boolean

************Algorithm*************************
high level
given a String
downcase the string
delete non alphanumerics
check if string equals reversed string
  if true, return true 
    if false return false 
=end

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  string == string.reverse

end  

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321')  == false

=begin Easy 3 counting the number of chars
 Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.
Examples: 
Please write word or multiple words: walk => There are 4 characters in "walk".
Please write word or multiple words: walk, don't run => There are 13 characters in "walk, don't run".
=end

=begin pedac

*************Problem***************************
Overall goal: count the number of chars in words
initial input: string (>= 1 word)
overall output: string "There are #{number} characters in #{string}."

explicit requirements:
write a program
ask user for input of a word or multiple words using this phrase
 " Please write word or multiple words: "
spaces should not be counted as a character



implicit requirements:
punctuation is counted
uppercase and lowercase are counted

questions:


*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:
Please write word or multiple words: walk => There are 4 characters in "walk". 
Please write word or multiple words: walk, don't run => There are 13 characters in "walk, don't run".

*************Data Structure********************
++the steps the data takes in between input 
++and output listed above
string > array > string
************Algorithm*************************
ask user to input string (string)
initialize local variable `input` to user input (string)
delete spaces in the string and assign to `input_no_spaces`
convert string > array 
  count the number of chars in array and save to local variable number
output "There are #{number} characters in \"#{input}\"."

=end

puts "Please write word or multiple words:"
input = gets.chomp

input_no_spaces = input.delete(' ')
number = input_no_spaces.chars.count
puts "There are #{number} characters in \"#{input}\"."

# or
puts "There are #{input.delete(" ").size} characters in \"#{input}\"."

# =begin Searching 101/Easy 3
# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.
# =end
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

=begin pedac

*************Problem***************************
Overall goal: tell the user if the 6th number is included in the first 5 numbers
initial input:6 strings
overall output: string that includes an array

explicit requirements:
write a program
get user input of 6 numbers
print a message telling user if the 6th number is included in the
  first 5 numbers



implicit requirements:
user input will be a String
need to convert to an array
2 different outputs depending on whether the number is included:
  'the number appears in' vs. 'the number does not appear in'
no need to account for empty array or less than 6 numbers input 
user input uses this format: ==> Enter the 2nd number:
for the last number: Enter the last number:

questions:
input validation? => no

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:
==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].

*************Data Structure********************
++the steps the data takes in between input 
++and output listed above
string > integer > array > string that includes integer and array

************Algorithm*************************

initialize empty return_array
  get user input with phrase '''==> Enter the 1st number:'`'
  convert input to Integer
  add integer to return_array
get user input with phrase `==> Enter the 2nd number:'
  convert input to Integer
  add integer to return_Array
get user input with phrase ==> Enter the 3rd number:
convert input to Integer
  add integer to return_Array
get user input with phrase ==> Enter the 4th number:
convert input to Integer
  add integer to return_Array
 get user input with phrase ==> Enter the 5th number:
convert input to Integer
  add integer to return_Array 
ask user' Enter the last number:' 
if array includes last_number
  output 'The number #[last_number} appers in array'
if array does not include last_number
  output 'The number #{last_number} does not appear in array'

=end

return_array = []
puts "==> Enter the 1st number:"
first = gets.chomp.to_i
return_array << first


puts "==> Enter the 2nd number:"
second = gets.chomp.to_i
return_array << second

puts "==> Enter the 3rd number:"
third = gets.chomp.to_i
return_array << third

puts "==> Enter the 4th number:"
fourth = gets.chomp.to_i
return_array << fourth

puts "==> Enter the 5th number:"
fifth = gets.chomp.to_i
return_array << fifth

puts "==> Enter the last number:"
last = gets.chomp.to_i

if return_array.include?(last)
  puts "The number #{last} appears in #{return_array}."
else 
  puts "The number #{last} does not appear in #{return_array}."
end