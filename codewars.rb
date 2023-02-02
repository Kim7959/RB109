=begin
https://www.codewars.com/kata/5a946d9fba1bb5135100007c/train/ruby
Given a List [] of n integers , find minimum number to be inserted in a list, so that sum of all elements of list should equal the closest prime number .

Notes

List size is at least 2 .

List's numbers will only positives (n > 0) .

Repetition of numbers in the list could occur .

The newer list's sum should equal the closest prime number .



E:
2-  minimumNumber ({2,12,8,4,6}) ==> return (5)
=end
=begin pedac

*************Problem***************************
Overall goal: find the minimum number to be inserted into array so that the sum of all element in array equals the closest prime number
initial input: an array
overall output: integer

explicit requirements:
 have to add one integer to the Array
 array has at least 2 elements
 write a method named minimum_number that takes one argument, an arr
know what are prime numbers

implicit requirements:

questions:

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:
minimum_number([3,1,2]) == 1
  3 + 1 + 2 == 6 so if you add 1 that == 7 which is prime
# minimum_number([5,2]) == 0
   5 + 2 == 7 which is prime so need to add 0
# minimum_number([1,1,1]) == 0
  1 +1+1 == 3 which is prime so need to add 0
# minimum_number([2,12,8,4,6]) == 5
  adds to 18, closet prime is 23, so add 5
# minimum_number([50,39,49,6,17,28]) == 2
*************Data Structure********************
array > integer

************Algorithm*************************
A. High Level Algorithm
  1. given an array
  1.5 sum the array
  2. generate an array of prime numbers
  3. calculate number needed so that array_sum + number = prime
  4. return number
B Detailed Algorithm
  1. given an array of integers
  2. sum integers and save to variable array_sum
  3. generate an array of prime numbers and save to prime_array ?? Prime.each(100) do |prime|
    array << Prime
  end
  4. if array_sum is within 0-6 of a number in the prime_array, select number and save to local variable prime
    prime_array.select |int|
    int> array_sum
      
  5. number - prime = integer
  
  
=end

require 'prime'

def minimum_number(array)
  sum_array = array.sum
  return 0 if Prime.prime?(sum_array)
  sum_doubled = sum_array * 2
  prime_array = []
  Prime.each(sum_doubled) { |prime| prime_array << prime }
  prime_array_filtered = prime_array.select { |num| num > sum_array}
  prime_array_filtered.first - sum_array
end

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2


=begin
=begin
33. Replace With Alphabet Position
(https://www.codewars.com/kata/546f922b54af40e1e90001da)
6 kyu
In this kata you are required to, given a string, replace every letter with its position in the alphabet.

If anything in the text isn't a letter, ignore it and don't return it.

"a" = 1, "b" = 2, etc.

Example
alphabet_position("The sunset sets at twelve o' clock.")
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)

# def alphabet_position(str)
#   alphabet_arr = ('a'..'z').to_a

#   char_array = str.downcase.chars.keep_if {|char| char =~ /[a-z]/}
#   num_array = char_array.map do |char|
#                 alphabet_arr.index(char) + 1
#               end

#   num_array.join(' ')
# end


p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""

=begin pedac

*************Problem***************************
Overall goal: to replace every char with it's corresponding number
initial input: string
overall output: string with chars replaced by numbers

explicit requirements:
make a method named alphabet_position that takes 1 arg 
ignore non alphabetical characters. Also don't return it. so this implies we have to delete all non alphabetical chars prior to conversion



implicit requirements:

questions: are we to return new string or modify existing string?

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:

*************Data Structure********************
string > hash > string

************Algorithm*************************
A. High Level Algorithm
  1. given a string
  2. delete all non alphabetical characters
  3. itnitialze a Hash
  4. convert string char to numeric char 
  5. return string 
B Detailed Algorithm
  1. given a string
  2. delete all non alphabetical characters and downcase
  3. then convert string to Array and assign to `array`
  4. initialze a hash contains {'a' => 1, 'b' => 2 etc}
  5. map over array 
      return array << hash[key] 
  6. array.join
=end

# def alphabet_position(string)
#   array = string.downcase.delete('^a-z').split(//)
#   hash = {'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6, 'g' => 7, 'h' => 8, 'i' => 9, 'j' => 10, 'k' => 11, 'l' => 12, 'm' => 13, 'n' => 14, 'o' => 15, 'p' => 16, 'q' => 17, 'r' => 18, 's' => 19, 't' => 20, 'u' => 21, 'v' => 22, 'w' => 23, 'x' => 24, 'y' => 25, 'z' => 26} 
#   return_array = array.map do |elem|
#     elem = hash[elem] 
#   end 
#   return_array.join(' ')

# end 
# # p alphabet_position("abc def")
# p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
# p alphabet_position("-.-'") == ""


=begin 
'a'.ord <> 97.chr
=end

=begin
47. Array.diff
(https://www.codewars.com/kata/523f5d21c841566fde000009/train/ruby)
6 kyu
Your goal in this kata is to implement a difference function, which subtracts one list from another and returns the result.

It should remove all values from list a, which are present in list b.

array_diff([1,2],[1]) == [2]
If a value is present in b, all of its occurrences must be removed from the other:

array_diff([1,2],[1]) == [2]


Goal: intake two arrays and subtract one list from the other and return the resulting Array
input: two arrays
output: Array

Rules:
- remove all values from list a which are present in list b


=end

def array_diff(arr1, arr2)
  arr1 - arr2
end

p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []

=begin Easy 5 Letter swap
Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces/

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'
=end 
=begin pedac

*************Problem***************************
Overall goal: take a string of words, and swap the first letter and last letter of each word
initial input: string
overall output: string

explicit requirements:
every word contains at least one letter
every string contains at least one word/ no need to account for empty strings
write a method named swap that takes 1 str arg 
no non alphabetical chars (numbers, punctuation)



implicit requirements:
maintain the given case, so `O` => `O` vs. `o` => `o`
questions:

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si' in first word, `h` and `O` are swapped. In second word `t` and the `w` are swapped => `thaw`. `a` is returned as `a` because it's only one letter, so no swapping occurs
swap('Abcde') == 'ebcdA'
`A` and `e` are now swapped but `bcd` remain the same
swap('a') == 'a' because only 1 letter in word, it returns the same word

*************Data Structure********************
string of words > array > string of swaped words

************Algorithm*************************
A. High Level Algorithm
  1. given a string of words
  2. iterate over words. for each word swap word[0] and word[last]
  3. return the string
B Detailed Algorithm
  1. given a string of words
  1.5 convert string to array using .split => array of words
  2. iterate over the words with map
    reassign word[0] == word[-1] and 
    reassign word[-1] == word[0]
  3. map or each will return swapped letters in array
  4. string.join to convert array to string
=end

def swap(string)
  # string = string.split

  string = string.split.each do |word| # 'what'
    word[0], word[-1] = word[-1], word[0] #'thaw'
   # ['t', 'w'] but it mutates the word
  end
  string.join(' ')

end


p swap('Oh what a wonderful day it is')  == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'


=begin
48. Where is my parent!?(cry)
(https://www.codewars.com/kata/58539230879867a8cd00011c/train/ruby )
Where's my parent?
6 kyu
Mothers arranged a dance party for the children in school. At that party, there are only mothers and their children. All are having great fun on the dance floor when suddenly all the lights went out. It's a dark night and no one can see each other. But you were flying nearby and you can see in the dark and have ability to teleport people anywhere you want.

Legend:
-Uppercase letters stands for mothers, lowercase stand for their children, i.e. "A" mother's children are "aaaa".
-Function input: String contains only letters, uppercase letters are unique.
Task:
Place all people in alphabetical order where Mothers are followed by their children, i.e. "aAbaBb" => "AaaBbb".

Goal: intake a string and sort it alphabetically by uppercase first followed by lowercase 
input: string
output: string

Rules:
- uppercase letters are mothers
- lowercase are children
- string contains only letters 
- uppercase letters are unique

E: 
p find_children("abBA") == "AaBb"
abBA >> AaBb
['aA', 'bB'] >> map and capitalize >> ['Aa', 'Bb'].join
sorted alphabetically
sorted by uppercase first
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
how do you sort by case?
  how to get little a's behind big A?
  iterater over intake string
    - if char =~ /[A-Z]/
      - push into new string >> 'A'
      - find every lowercase of uppercase letter and push into string
    - if new_string.include?(char.upcase)
      - push char into new_string
  

p find_children("CbcBcbaA") == "AaBbbCcc"

p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""
=end

# def find_children(str)
#   str.chars.sort_by {|char| char.downcase.ord}.join
# end 

# # find_children("abBA") >> "aAbB"
# # find_children("CbcBcbaA") >> "aAbBbCcc"
# # find_children("xXfuUuuF")>> "fFuUuuxX"

def find_children(str)
  return_array = []
  str.chars.sort.each do |char|
    if char =~ /[A-Z]/
      return_array << char
      return_array << char.downcase * str.count(char.downcase)
    end
  end
  return_array.join
end


p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""

# answer
def find_children(dancing_brigade)
  dancing_brigade.chars.sort_by { |char| [char.downcase, char] }.join
end

=begin Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

cleanup("---what's my +*& line?") == ' what s my line '
=end

=begin pedac

*************Problem***************************
Overall goal: remove all non-alphabetic chars from a string
initial input:string -with non alphabetic chars
overall output: string without non alphabetic chars

explicit requirements:
write a method named `cleanup` that takes 1 parameter-a string
delete all non alphabetical chars from the string and replace with an space
If >1 non alpha char appears in a row, you should have 1 space..not 2 or 3 or 4 etc
No uppercase letters
implicit requirements:
when you delete something, it is replaced with a space
  Then spaces are compacted into 1 space

questions:

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:
cleanup("---what's my +*& line?") == ' what s my line '
  deleted `---` => 1 space
  delted `'` => 1 space
  deleted '+*&' => only 1 space even though there were 1 space on either side
*************Data Structure********************
string >  string

************Algorithm*************************
A. High Level Algorithm
  1. given a string
  2. delete non alphabetical chars
    3. delete repeated spaces
B Detailed Algorithm
  1.  given a string
  2. delete non alphabetical chars using gsub(/[^a-z]/, ' ')
  3. if spaces > 1, delete spaces-1. deleting consecutive spaces using squeeze
  4. return original object, mutated
=end

def cleanup(string)
  string.gsub!(/[^a-z]/, ' ').squeeze!
end

p cleanup("---what's my +*& line?") == ' what s my line '

#
def word_pattern(str1, str2)
 
 return_string = str1.gsub('a', ' dog')
 return_string = return_string.gsub('b', ' cat').strip
 return true if return_string == str2
 return false if return_string != str2
 
  
end 

p word_pattern('aa', 'aaa')   == false
p word_pattern('abba', 'dog cat cat dog')  == true
p word_pattern('abba', 'dog cat cat fish') == false
p word_pattern('', '') == true
p word_pattern('aaaa', 'dog cat cat dog') == false

# # 1.Count letters in string 
# # (https://www.codewars.com/kata/5808ff71c7cfa1c6aa00006d/train/ruby)
# # 6 kyu

# =begin
# Count letters in string
# In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key and count as 'value'. The key must be 'symbol' instead of string in Ruby.

# Example:

# letter_count('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
# =end
# PEDAC TEMPLATE

# ************** Problem **************
# -write a method that takes a string as an argument
# -the method returns the lowercase letter count in a hash
# -in the hash letter will be the key and count will be the value
# -the key must be a symbol, not a string

# Questions:

# ************** Examples **************
# letter_count('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

# ************** Data Structures **************
# input: a String
# output: a hash

# ************** Algorithm **************
# -initialize a `result` variable and point it to an empty hash
# -convert string argument to an array of characters
# -iterate over the array of characters and:
# -look at the current character
# -if the current character downcased and converted to a symbol is not yet a key in my result hash, then I will add it as a symbol
# -else, if it is already there, I will increase the count (value)
# -implicitly return the `result` hash

# DRY
# ************** Code **************

def letter_count(str)
  result = {}
  arr = str.chars.reject { |char| char == char.upcase }
  arr.each do |char|
    char = char.to_sym # to avoid DRY
    if !result.has_key?(char)
      result[char] = 1
    else
      result[char] += 1
    end
  end
  result
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

# solve it with each_with_object
puts
def letter_count(string)
 string.chars.tally.transform_keys { |key| key.to_sym }
end
p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
# p letter_count('codewaArs') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}


=begin
You are given an array (which will have a length of at least 3, but could
be very large) 
containing integers. The array is either entirely comprised of odd 
integers or entirely
comprised of even integers except for a single integer N.
Write a method that takes the array as an argument and returns this 
"outlier" N

PROBLEM: Write a method that takes takes an array as an argument and returns the integer that doesint fit the pattern of all even or all odd? 
INPUT: Array of integers 
OUTPUT: Single interger (Not in a single integer in an array) 

Notes: 
Selection based problem reject/select 
Run two one is the even and ones i odd 

ALGORITHM 

Select only the odd numbers from input and add to variable odds 
-select method is odd?
Select only the even numbers from input and add to varioable even 
 -select method is even? 
Return odds if size is one 
  - return just the number 
returns even otherwise 

=end

def find_even_or_odd(array)
  odds = array.select { |num| num.odd? }
  evens = array.select { |num| num.even? }
  (odds.size == 1) ? (odds[0]) : (evens[0])
end


p find_even_or_odd([2, 4, 0, 100, 4, 11, 2602, 36]) == 11 
p find_even_or_odd([160, 3, 1719, 19, 11, 13, -21]) == 160 

=begin
# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".
=end 

=begin pedac

*************Problem***************************
Overall goal: for each integer in the array, find how many unique numbers are smaller than it
initial input: an array of integers
overall output: an array of integers (unique numbers)

explicit requirements:
  method name is smaller_numbers_than_current
  for each integer in array, find how many integers are < integer.
    then return only unique ones
      then count the unique ones
        return array of counted values


implicit requirements:
if you have an array of one integer, return 0
questions:

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:

smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
  8 has 4 integers that are smaller than it. But only 3 unique integers => 3, 1 has no integers that are smaller than it => 0, 2 has 1 integer smaller than it => 1,  has 3 integers smaller than it but only 2 unique values => 2
smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
  for each 7, there are no values smaller than it => 0
smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
smaller_numbers_than_current([1]) == [0]
    1 had no values that are smaller than it => 0

*************Data Structure********************
array of integers > array of integers

************Algorithm*************************
A. High Level Algorithm
  1. given array of integers
  1.5 initialize uniq_array to have array of unique numbers
  2.  count how many integers are < current integer
  3.  return counted values in return array
B Detailed Algorithm
  1. given array of integers
  initialize 'uniq_array' = array.uniq
  1.5 iterate over each integer
  2. 
  3. count integers that are < current integer
  4. add count to return_array
=end

def smaller_numbers_than_current(array)
  return_array = []
  uniq_array = array.uniq
  array.each do |integer| # change to integer_original
    count = 0
    uniq_array.each do |num| # change to integer_uniq
      count += 1 if integer > num   
    end    
    return_array << count
  end
  return_array
end
# amy help

def smaller_numbers_than_current(array)
  #return_array = []
 
  array.each_with_object([]) do |integer, return_array|
    count = 0
    array.uniq.each do |num|
      count += 1 if integer > num
    end
    return_array << count
  end
  #return_array
end
p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# do with loop

counter = 0
str = "hello"
loop do
  puts str[counter]
  counter += 1 
  break if counter == str.chars.size
end 

=begin
https://leetcode.com/problems/longest-palindrome/description/

Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.

Letters are case sensitive, for example, "Aa" is not considered a palindrome here.

 

Example 1:

Input: s = "abccccdd"
Output: 7
Explanation: One longest palindrome that can be built is "dccaccd", whose length is 7.
Example 2:

Input: s = "a"
Output: 1
Explanation: The longest palindrome that can be built is "a", whose length is 1.
=end

=begin
## P: Understanding the Problem:

We're given a string. We have to return an integer which represents the length of the longest palindrome that chan be build by the characters in the given string.

## E: Examples and Test Cases:
## D: Data Structures:

array of chars / combinations of chars

## A: Algorithm:

- initialize result array
- get all the combinations of characters from str.size down to one
- iterate trough array of combinations
  - if combination to string is palindrome
    - put size of that string to result array
- return the largest number from result array

# Algorithm:
- initialize result to 0
- count the characters using hash counting
- see if there is any character of just one count
  - add 1 to final resutl
- for all the characters which are larger than one in count and divisible by two
    - add all counts to the final result 

## C: Implementing a solution in Code:
=end

def longest_palindrome(str)
  str.chars.permutation(str.size) { |permutation| p permutation }
  # result = 0
  # counts = Hash.new(0)
  # str.chars.each do |char|
  #   counts[char] += 1
  # end 
  # # check for 1
  # result = 1 if counts.values.any?(1)
  # counts.values.each do |count|
  #   result += count if count % 2 == 0
  # end 
  # result
end 

# str.chars.permutation(str.size) { |permutation| p permutation }

def longest_palindrome(str)
  result = []
  (str.size).downto(1) do |length|
    str.chars.permutation(length) {|permutation| result << permutation if permutation.reverse == permutation}
  end
  result.uniq.max_by {|subarr| subarr.size}.size
end

p longest_palindrome('abccccdd') == 7
p longest_palindrome('a') == 1
p longest_palindrome('damam') == 5


# def longest_palindrome(str)
#   combinations = []
#   (str.size).downto(1) do |length|
#     combinations << str.chars.permutation(length).to_a.map(&:join)
#   end 
#   puts combinations.flatten
# end

=begin
Convert a String to a Signed Number!

In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise, you're going to extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.

Goal: intake a positive or negative signed string and return its integer representation with the correct sign.
input: String
output: integer

Rules:
- if '+' in the intake number it outputs a positive number with no Signal
- if '-' in the intake it outputs a neg. number with the '-' Signal
- can't use to_i

E:
# string_to_signed_integer('-570') == -570
' -570'>>  -570
# string_to_signed_integer('+100') == 100
'+100' >> 100

could be one of three ways, where string[0] is '+', '-' or an Integer

D:
input: String
intermediate: saving the string as an integer and then applying the correct symbol as a prefix
output: integer with the correct sign

A:
- use our string_to_integer method to convert the string to an Integer
- based on the str[0]
  - if '-' then return -integer
  - if '+' then return integer as is
  - otherwise just return the integer as well

=end


DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit } 
  value
end


def string_to_signed_integer(str)
  case str[0]
  when '-' then -(string_to_integer(str[1..-1]))
  when '+' then string_to_integer(str[1..-1])
  else          string_to_integer(str)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

# this is random left over from last people using gather
=begin

(https://www.codewars.com/kata/54b42f9314d9229fd6000d9c/train/ruby)
6 kyu
The goal of this exercise is to convert a string to a new string where each character in the new string is "(" if that character appears only once in the original string, or ")" if that character appears more than once in the original string. Ignore capitalization when determining if a character is a duplicate.

Examples
"din"      =>  "((("
"recede"   =>  "()()()"
"Success"  =>  ")())())"
"(( @"     =>  "))((" 

input:
- string 
output: 
- string 

Rules:
- ignore capitalization
- count each character in the inout string 
- explicit: new string to be returned 
- in case of single-occurence letters in the input string '('
- if letter repeats more than once in the input string, ')'
- implicit:
  - input string can have special characters and spaces, and they do count toward the tally 

Examples / Model Solution 
'recede'
 131313
 ()()()

 '(( @'
  2211
  ))((

Data points to capture:
  - the letter and its count 
    - hash 

Algo: 
- initialze empty string 
- turn the input string into an array
- get a tally of letters and their number of occurences--> hash
- set temp array with counts
- iterate over hash 
    - for every k/v pair
    - if the character in the input string is equal to the key in the hash, then push value into temp array 

- iterate over the tally 
    - with every iteration:
      - check the values (holds the counts)
        - if greater than 1, push ')' into the results string
        - otherwise, push '('  into the results string 

=end

def duplicate_encode(str)
  str.downcase!
  results = ''

  tally_up = str.chars.tally

  tally_up
  temp_counts = []
  str.chars.each_with_index do |letter, idx|
    temp_counts << tally_up[letter]
  end

  temp_counts.each do |occurences|
    if occurences > 1
      results << ')'
    else
      results << '('
    end
  end
  results
end


p duplicate_encode("din") == "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("

#Easy 5 prb 1

def ascii_value(str)
  sum = 0
    str.chars.each do |ch|
      sum += ch.ord
    end
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

def ascii_value(str)
  return 0 if str.empty?
  str.chars.map { |ch| ch.ord }.inject(:+) # same as .sum and reduce (reducing to one number)
end

=begin  count letters in string
In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key and count as 'value'. The key must be 'symbol' instead of string.

Example: 
letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
=end

=begin pedac

*************Problem***************************
Overall goal: count the lowercase letters in a string and return the letter count in a hash. :letter => count
initial input: string
overall output: hash - :letter => count

explicit requirements:
only lowercase letters in string
count each letter
return hash where letter is key and in symbol format
  count value is the value


implicit requirements:

questions:

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:
letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2} there are two 't's, two 'i'
 and the rest have only one occurrence
*************Data Structure********************
string > array > hash

************Algorithm*************************
A. High Level Algorithm
  1. given a string
  2. convert string to a array
  3. count number of times a letter appears
  4. convert to hash
B Detailed Algorithm
  1. given a string
  2. convert string to an array using `chars`
  3. each with object to convert array to a hash
  4. return the hash
=end

def letter_count(string)
  return_array = string.chars
  return_array.each_with_object(Hash.new(0)) do |char, hash|
    hash[char.to_sym] += 1
  end.sort.to_h
  
end

def letter_count(string)
  string.split(//).map {|k| k.to_sym}.sort.tally
end


p letter_count('codewars')  #== {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

21. Find the Mine!
(https://www.codewars.com/kata/528d9adf0e03778b9e00067e/train/ruby)
6 kyu

You've just discovered a square (NxN) field and you notice a warning sign. The sign states that there's a single bomb in the 2D grid-like field in front of you.
Write a function mineLocation/MineLocation that accepts a 2D array, and returns the location of the mine. The mine is represented as the integer 1 in the 2D array. Areas in the 2D array that are not the mine will be represented as 0s.
The location returned should be an array where the first element is the row index, and the second element is the column index of the bomb location (both should be 0 based). All 2D arrays passed into your function will be square (NxN), and there will only be one mine in the array.
=end

def mineLocation(array)
  return_array = []
  array.each_with_index do |subarray, index|
    if subarray.include?(1)
      return_array << index
      return_array << subarray.index(1)
    end
  end
  return_array
end


# or
def mineLocation(arrays)
  solution = ''
  
  arrays.select.with_index do |sub_array, idx|
    if sub_array.include?(1)
      solution = [idx, sub_array.index(1)]
    end
  end
  solution
end
# or
def mineLocation(field)
  field.flatten.index(1).divmod field.size 
end
    
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]

=begin
Given two words, how many letters do you have to remove from them to make them anagrams?
Example
First word : c od e w ar s (4 letters removed) o, d, w, s
Second word : ha c k er r a nk (6 letters removed) h, a, k, r, n, k
Result : 10 (sum of both)

remove the common letters then count them

=end

def anagram_difference(str1, str2)
    arr1 = str1.chars
    arr2 = str2.chars
    
    common_ele = []
    
    arr1.each do |ele|
        if common_ele.include?(ele)
            next
        elsif arr1.include?(ele) && arr2.include?(ele)
            common_ele << ele
        end
    end    
    
    (str1.length - common_ele.length) + (str2.length - common_ele.length)
    
end



p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank')  == 10

=begin 
4. Counting Duplicates
(https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/train/ruby)
6 kyu

Count the number of Duplicates
Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice
=end

=begin 
Goal: count the doubles of each string character in the input. case does not matter
input: string of letters/numbers 
output: integer of the number of doubles 

Rules:
letters and numbers 
upper and lowercase count as the same 
no spaces, no special characters 

Data Structure:
array

Algorithm:
initialize counter = 0 
split input into array of single characters 
call the count method on each character 
increment the counter if count is greater than 1 
return counter
=end 

def duplicate_count(input)
  counter = 0
  done_elements = []
  ele_array = input.downcase.split(//)

  ele_array.each do |ele|
    if done_elements.include?(ele)
      next
    end
    if ele_array.count(ele) > 1
      counter += 1
      done_elements << ele
    end
  end
  counter
end



p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2