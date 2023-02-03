=begin # 2
 
2.Find all pairs
(https://www.codewars.com/kata/5c55ad8c9d76d41a62b4ede3/train/ruby)
7 kyu

Find all pairs
You are given array of integers, your task will be to count all pairs in that array and return their count.
Notes:
Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs
of 0s)

Random tests: maximum array length is 1000, range of values in array is between 0 and 1000

Examples
[1, 2, 5, 6, 5, 2] --> 2
...because there are 2 pairs: 2 and 5
[1, 2, 2, 20, 6, 20, 2, 6, 2] --> 4
...because there are 4 pairs: 2, 20, 6 and 2 (again)


PEDAC TEMPLATE

************** Problem **************
-write a method that takes an array of integers as an argument
-the array will have some pairs of numbers
-count how many pairs (consider all numbers):
2 pairs of int 2 + 3 pairs of integer 5 == 5 paris in total
-if the array contains more pairs of the same number, count each pair only once
-if the argument array is empty or contains only 1 value, then return 0

Questions:

************** Examples **************
p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0

************** Data Structures **************
input: an array
output: an integer

************** Algorithm **************
-initialize `result` variable
-iterate through the array and tally elements
-this will give me a hash
-the key is the number, the value is how many times it will occur
-next if I divide the value by 2, I will get the pair of each number
-count first the pairs of each number
-return the result

************** Code **************
=end
def pairs(arr)
  h = arr.tally.transform_values { |v| v/2 }
  h.values.sum
end

p pairs([1, 2, 5, 6, 5, 2]) #== 2
# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
# p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
# p pairs([1000, 1000]) == 1
# p pairs([]) == 0
# p pairs([54]) == 0

#solve it with loop?


=begin # 3 
Return substring instance count
(https://www.codewars.com/kata/5168b125faced29f66000005/train/ruby)
7 kyu

=begin
Return substring instance count
Complete the solution so that it returns the number of times the search_text is found within the full_text.
Usage example:
solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1

=begin pedac

*************Problem***************************
Overall goal: find the number of times that a substring appears in a string
initial input: string, substring
overall output: integer (count)

explicit requirements:
given a string and substring
substring is found in the string
count the number of times it is found

implicit requirements:
only lower case letters, no non alphabetical chars
questions:

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:

p solution('abcdeb','b') == 2
=> 'b' occurs twice in the string > 2
p solution('abcdeb', 'a') == 1
=> 'a' occurs once in string > 1
p solution('abbc', 'bb') == 1
=> 'bb' occurs once in string > 1

*************Data Structure********************
string >array > integer

************Algorithm*************************
A. High Level Algorithm
  1. 
  1. convert string to array
  1.5 initialize count to 0
  2. iterate over array
  > using each
  3. if substring == ele, increase count by 1

abbc
a
ab
abb
abbc--

b
bb
bbc-

c-

=end

def substrings(string, substring)
  sub_array = []
  (0...string.size).each do |st_idx|
    (st_idx...string.size).each do |end_idx|
      sub_array << string[st_idx..end_idx] if string[st_idx..end_idx] == substring
    end
  end
  sub_array.size
end

# 0..0 => 'a'
# 0..1 => 'ab'
# 0..2 => 'abc'
# 0..3 => 'abcd'
# 0..4 => 'abcde'
# 0..5 => 'abcdeb'

# 1..1 => 'b'
# 1..2 => 'bc'
# 1..3 => 'bcd'
# 1..4 => 'bcde'
# 1..5 => 'bcdeb'


p substrings('abcdeb','b')

#OR

def solution(string, substring)
  count = 0
  string.chars.each do |char|
    count += 1 if char == substring
  end
  count
end


p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb')#  == 1

#OR

use scan : string.scan(substring).size

=begin # 4

https://www.codewars.com/kata/59d9ff9f7905dfeed50000b0)
7 kyu

Alphabet symmetry
Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet,
which are positions 4 and 5. Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) = [4, 3, 1]

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

=begin pedac

*************Problem********************
Overall goal: count the number of letters that are in the same position that they are in the alphabet
initial input: array of string or strings
overall output: array of integers/integers are the count

explicit requirements:
only alphabetical chars, both upper and lower cases
count uppercase as lowercase, A == a same count


implicit requirements:
output array has same length as input array(3 string => 3 elements)
questions:

**********Examples/Test cases************
p solve(["abode","ABc","xyzD"]) == [4,3,1]
=> 4 chars in the correct position => 4, 3 in the correct position => 3, 1 in the correct position => 1
p solve(["abide","ABc","xyz"]) == [4,3,0]
if nothing correct position => 0
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]

p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]



*************Data Structure**************
array > array

***************Algorithm*****************
1. initialize alphabet array [a,b,c..], array[0] == a, arary[1]==b
details: ('a..'z').to_a
2.string 'abide' string[0] == a, string [1] == b
details:
3.iterate over array 'abide' using map
details:downcase string, initialize count = 0
4. iterate over string using each char with index a b i d e
details: if char == alphabet array[index], count += 1
5. return count
details:
6.
details:
=end

def solve(array)
  alphabet = ('a'..'z').to_a
  array.map do |word|
    count = 0
    word.downcase.each_char.with_index do |char, index| 
      count += 1 if char == alphabet[index]
    end
    count
  end
end


p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

def solve(string)
  vowel_substrings = []
  (0...string.size).each do |start_index|
    (start_index...string.size).each do |end_index|
      vowel_substrings << string[start_index..end_index]
      end 
  end
  vowels = 'aeiou'
  new_array= vowel_substrings.select do |word|
        word.each_char.all? do |char|
          vowels.include?(char)
        end
      end
  new_array.sort_by {|word| word.length}[-1].size
end

# Amy solution

def substrings(string)
  (0...string.size).each_with_object([]) do |st_idx, sub_array|
    (st_idx...string.size).each do |end_idx|
      sub_array << string[st_idx..end_idx] if string[st_idx..end_idx].chars.all? {|char| char.match?(/[aeiou]/)}
    end
  end
end

def solve(string) # helper method
  substrings(string).max_by {|substring| substring.size}.size# invoked on return value from substring method
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8
=begin # 7
spot study session 9/8/22 with Mohammed. 
focused on pedac prep for 109 inteerview


Complete the function that takes an array of words.

You must concatenate the nth letter from each word to construct a new word which should be returned as a string, 
where n is the position of the word in the list.

For example:

["yoda", "best", "has"]  -->  "yes"
  ^        ^        ^
  n=0     n=1     n=2
Note: Test cases contain valid input only - i.e. a string array or an empty array; 
and each word will have enough letters.


p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars

Problem  - given an array of strings, return a single string that contains as many characters as the array has elements.


The array element index dictates the string index of the character to collect.
Rules:
If the array is empty - the return string is empty 

input: an array of string elements
Array of strings ['yoda', 'best', 'has']
first element as a string 
first character
first character - > a string object or maybe an array to be truned into a string
output: A string object - single word 

Algorithm:
intiate an array for results
Identify the array index location 
  Iterate over each word with the index 
  Identify and collect the string character with the same index.
  Add that to the results.

return the results

=end 

def nth_char(array)
  results = ''r
  array.each_with_index do |word, ind|
    results << word[ind]
  end
  results 
end
p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'Nom
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'

=begin # 9
#9.Typoglycemia Generator
# (https://www.codewars.com/kata/55953e906851cf2441000032/train/ruby)
# 5 kyu

=begin
Background
There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the letters. 

Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.

In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement
return a string where:

1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions

1) words are separatedseperated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
4) for this kata punctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation


*************Problem***************************
Goal: return words with 1st and last characters the same, but all the char in between are in alphabetical order
initial input: string 
overall output: string 

explicit requirements:
write a method named scramble_words that takes 1 parameter
punctuation remains at the same place
   hyphen(-), apostrophe('), comma(,) and period(.)
ignore capitalization
special characters do not take the position of the non special characters, for example: -dcba -> -dbca
only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk. ignore the `-`
implicit requirements:
An empty string returns an empty string
If a word only has 3,2 or 1 characters, return the word unscrambled
questions:

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:
'card-carrying' --> 'caac-dinrrryg'
'dcba.'  --> 'dbca.'
*************Data Structure********************
++the steps the data takes in between input 
++and output listed above

************Algorithm*************************
A. Main Method
  1. Save characters at 0 index and last index into new string `scramble`
  1. Create an array of the characters from the 1st index to the next to last index.
  2. Sort this array alphabetically
  3. insert joined array turned string object into the `scramble` string at the appropriate index
IF last character or first character is non-alphanumeric
  - ignore the character
Sort around it

for reference: http://en.wikipedia.org/wiki/Typoglycemia
=end

def scramble_words(words)
  if words.size < 4
    words
  elsif words.include?('^A-z0-9')
    empty_char_array = words.chars.map {|char| char.delete('A-z') } 
    p empty_char_array 
    alphabetical = words.chars[1..-2].sort.join
    words = words[0] + alphabetical + empty_char_array.join + words[-1]
  else
   alphabetical = words.chars[1..-2].sort.join
   words = words[0] + alphabetical + words[-1]
  end


end

p scramble_words('professionals')  == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') # == 'caac-dinrrryg'
 p scramble_words("shan't") == "sahn't"
 p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
 p scramble_words("you've gotta dance like there's nobody watching, 
 love like you'll never be hurt, sing like there's nobody listening, 
 and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, 
 love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."