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