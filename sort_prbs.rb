=begin
Sort by Last Char
https://www.codewars.com/kata/57eba158e8ca2c8aba0002a0/train/ruby

Given a string of words (x), you need to return an array of the words, sorted alphabetically by the final character in each.

If two words have the same last letter, they returned array should show them in the order they appeared in the given string.

All inputs will be valid.

string of words > array of same words sorted ascending by last char in each word
 string 
 convert string to array using .split
  sort_by last char
=end 

def last(string)
  string.split.sort_by {|word| word[-1]}

end


p last('man i need a taxi up to ubud') == ['a', 'need', 'ubud', 'i', 'taxi', 'man', 'to', 'up']
p last('what time are we climbing up the volcano') == ['time', 'are', 'we', 'the', 'climbing', 'volcano', 'up', 'what']
p last('take me to semynak') == ['take', 'me', 'semynak', 'to']
p last('massage yes massage yes massage') == ['massage', 'massage', 'massage', 'yes', 'yes']
p last('take bintang and a dance please') == ['a', 'and', 'take', 'dance', 'please', 'bintang']

###
=begin
Sort an array by value and index
https://www.codewars.com/kata/58e0cb3634a3027180000040/train/ruby
Your task is to sort an array of integer numbers by the product of the value and the index of the positions.

For sorting the index starts at 1, NOT at 0!
The sorting has to be ascending.
The array will never be null and will always contain numbers.

Example:

Input: 23, 2, 3, 4, 5
Product of value and index:
23 => 23 * 1 = 23  -> Output-Pos 4
 2 =>  2 * 2 = 4   -> Output-Pos 1
 3 =>  3 * 3 = 9   -> Output-Pos 2
 4 =>  4 * 4 = 16  -> Output-Pos 3
 5 =>  5 * 5 = 25  -> Output-Pos 5

Output: 2, 3, 4, 23, 5

given 1 array of integers
sort the integers based on integer*index + 1
return new array
sort ascending

array
iterate using sort_by.with_index
  
=end

def sort_by_value_and_index(array)
  
  array.sort_by.with_index do |int, index|
      int*(index + 1)
  end


end


p sort_by_value_and_index([ 1, 2, 3, 4, 5 ]) == [ 1, 2, 3, 4, 5 ]
p sort_by_value_and_index([ 23, 2, 3, 4, 5 ]) == [ 2, 3, 4, 23, 5 ]
p sort_by_value_and_index([ 26, 2, 3, 4, 5 ]) == [ 2, 3, 4, 5, 26 ]
p sort_by_value_and_index([ 9, 5, 1, 4, 3 ]) == [ 1, 9, 5, 3, 4 ]

##
=begin 
Sort Santa's Reindeer
https://www.codewars.com/kata/52ab60b122e82a6375000bad
Write a function that accepts a sequence of Reindeer names, and returns a sequence with the Reindeer names sorted by their last names.
Notes:

    It's guaranteed that each string is composed of two words
    In case of two identical last names, keep the original order

Examples

For this input:

[
  "Dasher Tonoyan", 
  "Dancer Moore", 
  "Prancer Chua", 
  "Vixen Hall", 
  "Comet Karavani",        
  "Cupid Foroutan", 
  "Donder Jonker", 
  "Blitzen Claus"
]

You should return this output:

[
  "Prancer Chua",
  "Blitzen Claus",
  "Cupid Foroutan", 
  "Vixen Hall", 
  "Donder Jonker", 
  "Comet Karavani",
  "Dancer Moore", 
  "Dasher Tonoyan",
]

array > new array sorted by last name ascending

Array of names
each name has 2 words
sort by the 2nd word
=end 

def sort_reindeer(array)
  array.sort_by do |name| # "Dasher Tonoyan"
    name.split[-1]
  end

end
p sort_reindeer(
    ["Dasher Tonoyan", "Dancer Moore", "Prancer Chua", "Vixen Hall", "Comet Karavani",  "Cupid Foroutan", "Donder Jonker", "Blitzen Claus"])
    == ["Prancer Chua", "Blitzen Claus", "Cupid Foroutan", "Vixen Hall", "Donder Jonker", "Comet Karavani", "Dancer Moore", "Dasher Tonoyan"]
    
    ####
    =begin 
Sort rectangles and circles by area II
https://www.codewars.com/kata/5a1ebc2480171f29cf0000e5
In this kata you will be given a sequence of the dimensions of rectangles ( sequence with width and length ) and circles ( radius - just a number ).
Your task is to return a new sequence of dimensions, sorted ascending by area.

For example,

seq = [ [4.23, 6.43], 1.23, 3.444, [1.342, 3.212] ] # [ rectangle, circle, circle, rectangle ]
sort_by_area(seq) => [ [1.342, 3.212], 1.23, [4.23, 6.43], 3.444 ]

given an array
sort the array
  if element is an array, array[0] * array[1]
  if element is a float, 3.14 * ele**2
=end 

def sort_by_area(array)
  array.sort_by do |element|
    if element.is_a?(Array) #  if element.class == Array
      element[0] * element[1] #  element.first * element.last 
    else 
      3.14 * element**2
    end
  end

end


p sort_by_area([[4.23, 6.43], 1.23, 3.444, [1.342, 3.212]]) == [[1.342, 3.212], 1.23, [4.23, 6.43], 3.444]
p sort_by_area([1.23]) == [1.23]
p sort_by_area([[2.345, 5.6765]]) == [[2.345, 5.6765]]
p sort_by_area([[2, 5], 6]) == [[2, 5], 6]
###
=begin 
https://www.codewars.com/kata/55c45be3b2079eccff00010f/train/ruby

Your task is to sort a given string. Each word in the string will contain a single number. This number is the position the word should have in the result.

Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).

If the input string is empty, return an empty string. The words in the input String will only contain valid consecutive numbers.

string > new sorted string
string convert to array using split # 'is2'
  iterate over array using sort # 'is2'
   chars.sot.join

=end 

def order(string)
 string.split.sort_by do |word|
    word.chars.sort.join
  end.join(' ')
end

p order("is2 Thi1s T4est 3a")  == "Thi1s is2 3a T4est"
p order("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
p order("") == ""
####
=begin not a sort problem!
Sort the Vowels!
https://www.codewars.com/kata/59e49b2afc3c494d5d00002a
In this kata, we want to sort the vowels in a special format.
Task

Write a function which takes a input string s and return a string in the following way:

   
                  C|                          R|
                  |O                          n|
                  D|                          d|
   "CODEWARS" =>  |E       "Rnd Te5T"  =>      |
                  W|                          T|
                  |A                          |e
                  R|                          5|
                  S|                          T|

Notes:

    List all the Vowels on the right side of |
    List every character except Vowels on the left side of |
    for the purpose of this kata, the vowels are : a e i o u
    Return every character in its original case
    Each line is seperated with \n
    Invalid input ( undefined / null / integer ) should return an empty string
given a string > return a new string
return_string 
vowels =
iterate over string using each_char
      if vowels includes char
        add | + char + \n to retn string
      else add char + | + \n to retn string
return retn string

=end 

def sort_vowels(string)
  return_string = ''
  vowels = 'aeiouAEIOU'
  string.each_char do |char|
    if vowels.include?(char)
      return_string << '|' + char + "\n"
    else
      return_string  << char + '|' + "\n"
    end
  end
  return_string[0..-2]
end


p sort_vowels('Codewars')  == "C|\n|o\nd|\n|e\nw|\n|a\nr|\ns|"
p sort_vowels('Rnd Te5T')  == "R|\nn|\nd|\n |\nT|\n|e\n5|\nT|"

##me example hash

=begin
Given a hash, return an array of states sorted by rank, in descending order
expected output is ["New York", "Maine", "Alaska", "Hawaii"]
=end

def sort_the_states(hash)
  array = hash.keys # ["Maine", "New York", "Hawaii", "Alaska"]
  
  array.sort_by do |state|
    hash[state]
  end.reverse
  
end

p sort_the_states({"Maine" => 3,"New York" => 4, "Hawaii" => 1, "Alaska" => 2,  }) # == ["New York", "Maine", "Alaska", "Hawaii"]

=begin words = "hello there Amy, Ewa, Kim".split
# this has to be sorted accounting for capital letters first
expected: ["Amy", "Ewa", "Kim", "hello", "there"]
given a string > new array
convert string to array using  split
sort the array using sort

=end 

words = "hello there Amy, Ewa, Kim"

# array = words.split.sort
# p array

puts

# p words.split.sort_by { |word| word.downcase }
# p words.split.sort_by(&:length)

# "10.mp3", "21.mp3"

# p music = %w(21.mp3 10.mp3 5.mp3 40.mp3)
music = ["10.mp3", "21.mp3", "40.mp3", "5.mp3"]
# p music.sort_by {|elem| elem.to_i }

# p "33kim amy".to_i
# p "kim a45my".to_i
# p "kim amy55".to_i

p (music.sort_by do |element|
  new_music = element.split('.')
  new_music[0].to_i
end)

######
# https://www.codewars.com/kata/5701800886306a876a001031/train/ruby?collection=sorting

=begin
Suzuki needs help lining up his students!

Today Suzuki will be interviewing his students to ensure they are progressing in their training. 
He decided to schedule the interviews based on the length of the students name in descending order. The students will line up and wait for their turn.

You will be given a string of student names. Sort them and return a list of names in descending order.

Here is an example input:string = 'Tadashi Takahiro Takao Takashi Takayuki Takehiko Takeo Takeshi Takeshi'

Example return:
lst = ['Takehiko',
        'Takayuki',
        'Takahiro',
        'Takeshi',
        'Takeshi',
        'Takashi',
        'Tadashi',
        'Takeo',
        'Takao']

Names of equal length will be returned in reverse alphabetical order (Z->A) such that:

string = "xxa xxb xxc xxd xa xb xc xd"

Returns

['xxd', 'xxc', 'xxb', 'xxa', 'xd', 'xc', 'xb', 'xa']

=end


def lineup_students(students)
  students.split.sort_by { |name| [name.length, name] }.reverse
end

[3, 'xxd']
[3, 'xxc']
[3, 'xxb']
[3, 'xxa']
[2, 'xa']
[2, 'xb']
[2, 'xc']
[2, 'xd']

def lineup_students(students)
  students = students.split
  students.sort do |a,b| 
    if b.length == a.length
      b <=> a
    else
      b.length <=> a.length
    end
  end
end

 def lineup_students(students)
   students.split(" ").sort.sort_by(&:length).reverse
 end

p lineup_students("xxa xxb xxc xxd xa xb xc xd") # == ['xxd', 'xxc', 'xxb', 'xxa', 'xd', 'xc', 'xb', 'xa']

 p lineup_students('Tadashi Takahiro Takao Takashi Takayuki Takehiko Takeo Takeshi Takeshi') ==['Takehiko','Takayuki','Takahiro','Takeshi','Takeshi','Takashi','Tadashi','Takeo','Takao']

 p lineup_students("Shig  Toshi  Tsuneo  Uyeda  Shuji  Ryuu") == ["Tsuneo", "Uyeda", "Toshi", "Shuji", "Shig", "Ryuu"]
