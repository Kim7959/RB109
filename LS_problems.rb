=begin
Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.
You may not use Array#reverse or Array#reverse!.

list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true
=end
=begin
Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.
You may not use Array#reverse or Array#reverse!.

Note: for the test case list = ['abc'], we want to reverse the elements in the array. The array only has one element, a String, but we're not reversing the String itself, so the reverse! method call should return ['abc'].

=begin pedac

*************Problem***************************
Overall goal: take an array and reverse the elements in the array
initial input: array
overall output: same array, mutated

explicit requirements:
write a method named reverse!, takes 1 array ArgumentError
if there is only 1 element in the array, return array unmutated


implicit requirements:
empty array will return empty array
array can contain strings or numbers
sort is based on index position not value
questions:

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:
reverse!("abc") == ["abc"] # true
reverse!([]) == [] # true
reverse!(['a', 'b', 'e', 'd', 'c']) == ["c", "d", "e", "b", "a"]
*************Data Structure********************
array > array

************Algorithm*************************
A. High Level Algorithm
  1.given an array
  2.reverse the elements in array
  3. return the array, mutated in place
B Detailed Algorithm
  1.given an array
  2. iterate over array
  3.  take last element and make it first element
    take the 2nd to last element and make it the 2nd element
  4. return the array
=end

def reverse!(list)
  return list if list.size < 2

  positive = 0
  negative = -1
  
  loop do
   list[positive], list[negative] = list[negative], list[positive]
   negative -= 1
   positive += 1
   break if positive == list.length / 2
  end
  list
end

  
# p reverse!(["abc"]) == ["abc"] # true
# p reverse!([]) == [] # true
p reverse!(['a', 'b', 'e', 'd', 'c']) #== ["c", "d", "e", "b", "a"]
  
# chris 2

def reverse!(list)
  left = ''
  right = ''
  positive = 0
  negative = -1

  loop do
    left = list[positive]
    right = list[negative]

    list[positive] = right 
    list[negative] = left 

    positive += 1
    negative -= 1
    break 
  end
end
#ewa
def reverse!(arr)
  return arr if arr.empty?
  target = arr.size  # I want to have that many elements
  mutated_array_index = 0 # I have that many elements
  last_element_index = arr.size - 1 # I will start reversing/building my target array with this element
  loop do
    arr.push(arr[last_element_index])
    arr[last_element_index] = '' # change what I don't need anymore to an empty string
    last_element_index -= 1
    mutated_array_index += 1
    break if mutated_array_index == target
  end
  p arr
  arr.reject! { |ch| ch == "" } # get rid of all empty strings
end



=begin
The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
=end 

=begin pedac

*************Problem***************************
Overall goal: convert minute-based time into 24 hour time
initial input: integer (pos, neg or 0)
overall output: string

explicit requirements:
write a method named time_of_day that takes 1 arg, an Integer
You may not use ruby's Date and Time classes.
if integer is positive >> time is after midnight
  if integer is negarive >> time is before midnight
    if integer is 0 then it is midnight
convert minute based format into 24 hour format
      string returned is in 24 hour format "01:29"



implicit requirements:

questions:

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:
time_of_day(0) == "00:00"
      0 >> "00:00" because its midnight. 0.divmod(60) => [0,0]
time_of_day(-3) == "23:57" 3.divmod(60) => [-1, 57]
      -3 >> "23:57" because its 3 minutes BEFORE midnight 0 + - 3
time_of_day(35) == "00:35"
      35 >> "00:35" because it is 35 minutes AFTER midnight 0 +3
time_of_day(-1437) == "00:03"
      because its 3 minutes the day before
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

*************Data Structure********************

    integer >> string
************Algorithm*************************
A. High Level Algorithm
  1.given an integer
  2. if integer > 1439 integer.divmod and assign result to hours, minutes
  2.5 if negative 24 - integer
  3. convert the sum into 24 hour time format 00:00 string
B Detailed Algorithm
  1. given an integer
  2. sum = 0 + integer
  3.
  4. use format to get into 24 hour time format

Hint:  The Integer#divmod method and the % (modulo) operator may prove useful in your solution. You may also find Kernel#format handy for formatting your results.

You may want to solve this problem for non-negative arguments that are between 0 and 1439 first. Once you've done that, try handling arguments that are greater than 1439. Finally, solve it for negative values. Think about how you might be able to simplify the final two parts. (Hint: one day is 1440 minutes)
=end

def time_of_day(minutes)
  hours, minutes = minutes.divmod(60)
  "#{'%02d' % (hours%24)}:#{'%02d' % minutes}"
end

=begin
In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'
=end

=begin pedac

*************Problem***************************
Overall goal: take a signed integer and convert to a string
initial input: integer which may have a + or - sign
overall output: string, include + or - sign if present

explicit requirements:
write a method called signed_integer_to_string that takes one
  parameter-integer
cannot use `Integer#to_s`
can use the method created on prev exercise
if a postive number, include the + sign
if `-` sign is included at the beg of the integer, include tht in String
the only integer that doesnt have a sign is `0`



implicit requirements:

questions:

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:
signed_integer_to_string(4321) == '+4321'
  the positive integer `4321` => +4321
signed_integer_to_string(-123) == '-123'
  the negative integer `-123` => -123
signed_integer_to_string(0) == '0'
  0 is neither postive or negative so returns `0`

*************Data Structure********************
integer > string

************Algorithm*************************
A. High Level Algorithm
  1. given a integer
  2. intialize 2 arrays one with pos integers as strings,
  one with negative integers as strings
  3. take string value and add to return_string
  4. return return_string
B Detailed Algorithm
  1.given integer
  2.init one array of digits containing integers as strings
  3. initialize return_string
  4.  if positive number, loop from yesterday's assignment then prepend a + sign
  5. if negative number, get absolute value of number then loop from yesterdays assignment then add `-` sign
=end
# DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']


# def signed_integer_to_string(number)
#   return_string = ''
#   if number > 0
#     loop do
#       number, remainder = number.divmod(10) #4321
#       return_string.prepend(DIGITS[remainder])
#       break if number == 0
#     end
#     return_string.prepend('+')
#   elsif number < 0
#     loop do
#       number, remainder = number.abs.divmod(10) #4321
#       return_string.prepend(DIGITS[remainder])
#       break if number == 0
#     end
#     return_string.prepend('-')
#   else
#     number = '0'
    
#   end

=begin
https://www.codewars.com/kata/529872bdd0f550a06b00026e/train/ruby


Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

E:
greatestProduct("123834539327238239583") // should return 3240

Goal: intake a string and return the highest product possible from 5 digit strings

input: String
output: Integer

Rules: 
- only calculate the product of 5 digit strings
- return the highest product possible

E:
Test.assert_equals(greatest_product("123834539327238239583"), 3240)
12383, 23834, 38345, 83453, 34539, 34539, 45393, 53932, 39327, 93272, 32723, 27238, 72382, 23822, 38239, 
82395, 23958, 39583



Test.assert_equals(greatest_product("395831238345393272382"), 3240)
Test.assert_equals(greatest_product("92494737828244222221111111532909999"), 5292)
92494, 24947, 49473, 94737, 47378, 73782, 37828, 78282, 82824, 

["92494", "24947", "49473", "94737", "47378", "73782", "37828", "78282", "82824", "28244", "82442", "24422", "44222", "42222", "22222", "22221", "22211", "22111", "21111", "11111", "11111", "11111", "11115", "11153", "11532", "15329", "53290", "32909", "29099", "90999", "09999"]

Test.assert_equals(greatest_product("02494037820244202221011110532909999"), 0)

D: input: String
intermediate: array of products of the 5 digit strings
output: Integer

A:
- initialize substrings_arr to an empty array >> "123834"
- iterate over the string and save all 5 digit substrings into the substrings_arr >> "12383", "23834"
- iterate over the substrings_arr and map the product of the 5 digit substrings to the Index >> [1, 2, 3, 8, 3].reduce(:*) = 144, [2, 3, 8, 3, 4].reduce(:*) = 576
- return the product that is the lowest >> 144
=end

def five_digit_substrings(str)
  substrings_arr = []
  (0...str.size).each do |st_idx|
    (st_idx...str.size).each do |end_idx|
      substrings_arr << str[st_idx..end_idx] if str[st_idx..end_idx].size == 5
    end
  end
  substrings_arr
end
# p five_digit_substrings("123834539327238239583")


def greatest_product(str)
  substrings = five_digit_substrings(str)
  substrings.map {|substr| substr.chars.map(&:to_i).reduce(:*)}.max 
end

class Test 
  def self.assert_equals(num1, num2)
    puts "Expected: #{num2}"
    puts "Actual: #{num1}"
    puts "Pass? #{num1==num2}\n"
  end 
end 

# Test.assert_equals(greatest_product("123834539327238239583"), 3240)
# Test.assert_equals(greatest_product("395831238345393272382"), 3240)
Test.assert_equals(greatest_product("92494737828244222221111111532909999"), 5292)
Test.assert_equals(greatest_product("02494037820244202221011110532909999"), 0)

def crunch(str)
  result = ''
  counter = 0
  while counter < str.size
    if str[counter + 1] != str[counter]
      result << str[counter]
    end
    counter += 1
  end
  result
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

=begin
Write a method that will take a short line of text, and print it within a box.
You may assume that the input will always fit in your terminal window.

Ex: print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

Ex: print_in_box('')
+--+
|  |
|  |
|  |
+--+
=end
=begin pedac

*************Problem***************************
Overall goal: take a string and output string within a box
initial input: string
overall output:  string

explicit requirements:
there's a space before and after the given string.
  there's one line above and beow the String
Empty box has a structure

implicit requirements:
Box will auto expand to fit length of string
questions:

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:

*************Data Structure********************


************Algorithm*************************
A. High Level Algorithm
  1.Build the empty and expandable box
  2. put string in middle of box
  3. output box
B Detailed Algorithm
  1. determine the string length
  1. use puts to output each line of box
  2. 5 puts lines to build empty box
  3. expand box to length of string + 2
  4. puts string in middle line
=end

def print_in_box(string)
  length = string.length + 2
  puts "+" + "-" * length + "+"
  puts "|" + " " * length + "|"
  puts "|" + " " + string + " "+ "|"
  puts "|" + " " * length + "|"
  puts "+" + "-" * length + "+"

end

print_in_box('')
print_in_box('To boldly go where no one has gone before.')


def print_in_box(message)
  horizontal_rule = "+#{'-' * (message.size + 2)}+"
  empty_line = "|#{' ' * (message.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{message} |"
  puts empty_line
  puts horizontal_rule
end


=begin 
Count the number of Duplicates

Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice
=end

=begin 
Goal: RETURN A COUNT of the letters that have duplicates in each word

input: string of characters 
output: integer representing the count of duplicate characters in the string 

rules:
case insensitive 
  letters and numbers count 
  no special characters 
  no floats 

Data structures:
arrays 

Algorithm 
if then: empty arrays return 0 
split string by letter (//)  
iterate over string with select
 if count for each element > 1
  add element to the new array 
  call uniq on the return array 
  count the return array 

  return the count

=end

def duplicate_count(string)
  splt_str = string.downcase.split(//)
  answer_arr = []

  answer_arr = splt_str.select do |elem|
    elem if splt_str.count(elem) > 1
  end
  
  return 0 if answer_arr == []
  answer_arr.uniq!.count
end

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2
# or

def duplicate_count(text)
  ('a'..'z').count { |c| text.downcase.count(c) > 1 }
end

#+++++
require 'prime'
def minimum_number(arr)
  sum = arr.sum 

  loop do 
    if is_prime?(sum) == false 
      sum += 1
    elsif is_prime?(sum) == true
      return sum - arr.sum
      break if is_prime?(sum) == true
    end
    sum - (arr.sum)
  end
end

def is_prime?(sum)
  sum.prime?
end

# def diamond(n)
#   new_array = (1..n-2).each_with_object([]) do |integer, array|
#     array << integer if integer.odd?
#   end
  
#   new_array.each do |num|
#     puts ('*'*num).center(n)
#   end
  
#   new_array = (-n..-1).each_with_object([]) do |integer, array|
#     array << integer if integer.odd?
#   end
  
#   new_array.each do |num|
#     puts ('*'*num.abs).center(n)
#   end
# end
# diamond(9)

# outline only
def diamond(n)
  new_array = (1..n-2).each_with_object([]) do |integer, array|
    array << integer if integer.odd?
  end
  # p new_array
  new_array.each do |num|
    if num == 1
      puts "*".center(n + 2)
    else
      puts ('*' + (" " * (num) + '*')).center(n + 2)
    end
  end
  
  new_array = (-n..-1).each_with_object([]) do |integer, array|
    array << integer if integer.odd?
  end
  # p new_array
  
  new_array.each do |num|
    if num == -1
      puts "*".center(n + 2)
    else
      puts ('*' + (" " * (num).abs) + '*').center(n + 2)
    end
  end
end

diamond(9)

# Write a method that will take a short line of text, and print it within a box.
# You may assume that the input will always fit in your terminal window.
=begin
print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+
=end

=begin pedac

*************Problem***************************
Overall goal: output a box that surrounds the text input
initial input: string
overall output: string (box with the original string inside)

explicit requirements:
box should auto expand
empty string => empty box 
input size will always fit in the terminal window. Means that the box doesn't have to wrap to next line.
method is called print_in_box



implicit requirements:
the text goes in the middle of the box
the text is copied exactly to the box
there is a space before and after the string. One empty line above and one empty line below the string.
with empty string, there are 2 spaces in the box

questions:

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:

*************Data Structure********************
++the steps the data takes in between input 
++and output listed above

************Algorithm*************************
high level
make a box structure that is empty and expands
place the string inside the box
output the box

specific
determine string length
initialize `length`variable to equal length of string + 2
draw the empty box: 

puts "+--+" -->   puts "+" + ("-" * (length + 2)) + "+"
puts "|  |" -->   puts "+" + (" " * (length + 2)) + "+"
puts "|  |" -->   puts "|" + string + " |" # or string.center(length + 2)
puts "|  |" -->   puts "+" + (" " * (length + 2)) + "+"
puts "+--+"  ->   puts "+" + ("-" * (length + 2)) + "+"

=end

# def print_in_box(string)
#   length = string.size
#   puts "+" + ("-" * (length + 2)) + "+"
#   puts "|" + (" " * (length + 2)) + "|"
#   puts "|" + " " + string + " " + "|" # or string.center(length + 2)
#   puts "|" + (" " * (length + 2)) + "|"
#   puts "+" + ("-" * (length + 2)) + "+"


# end


def print_in_box(string)
  length = string.size
  puts "+" + ("-".center(length + 2, "-")) + "+" # need to copy down
  puts "|" + (" " * (length + 2)) + "|"
  puts "|" + " " + string + " " + "|" # or string.center(length + 2)
  puts "|" + (" " * (length + 2)) + "|"
  puts "+" + ("-" * (length + 2)) + "+"


end

# p print_in_box('')
p print_in_box('To boldly go where no one has gone before.')

=begin letter counter part 1
Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.
=end

def word_sizes(str)
 arr = str.split(" ")

 count = arr.map do |x|
  x.length
 end

 count.sort.tally
end


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}


=begin
*************PROBLEM***************************
*coding goal: create hash that shows word sizes (keys) and the number of workds with those sizes (values)

*initial input: String of characters

*overall output: non-nested hash of keys and values

*explicit requirements: 
-spaces do not count 
-punctuation counts

*implicit requirements:
-empty string should return an empty hash
 
*questions:
 
*************EXAMPLES AND TEST CASES************
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }

*restate all test cases given (or write out an example for clarity)

*add edge cases, 0 and empty:

*************DATA STRUCTURE*********************
string, array, hash
**any patterns from test cases, or 
  notable data structure? what kind can i use:

**************SCRATCH PAD***********************
- split string to array to count, then add info to hash
************ALGORITHM***************************

A. Main Method (high-level | What is my overarching process)
  1. split the string into an array, via spaces -split(" ")
  iterate over each word (map) and get a total count of each word (into array)
    [[6=>1], [6=>1]]
  tally the number of words with similar counts

=end

def word_sizes(str)
  arr = []
  nums = {}
  counter = 0
  
  loop do  
    arr = str.split(//)
    nums.store(arr.count[counter]) 
    break if counter == str.length
   counter += 1
    end
  p nums
  end