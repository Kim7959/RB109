=begin
https://leetcode.com/problems/check-if-binary-string-has-at-most-one-segment-of-ones/
1784. Check if Binary String Has at Most One Segment of Ones

Given a binary string s ​​​​​without leading zeros, return true​​​ if s contains at most one contiguous segment of ones. Otherwise, return false.

 

Example 1:

Input: s = "1001"
Output: false
Explanation: The ones do not form a contiguous segment.
Example 2:

Input: s = "110"
Output: true
 

Goal: intake a string of digits and return true if the string contains at most one contiguous substring of ones >> '11'.

input: String
output: boolean

Rules:
- string can only contain one substring of multiple 1's.
- intake string will not contain leading zeros. 

E:

Input: s = "1001"
Output: false
Explanation: The ones do not form a contiguous segment.

Example 2:

Input: s = "110"
Output: true
 
D:
input: String
intermediate: array
output: boolean

A:
input: String
- initialize `substrings` to an empty array
- iterate through the indices of the input string
    - then push current substring into `substrings`
- iterate through `substrings` and delete any substring that contains 0
- if `substrings` is empty return false
- otherwise return true
output: boolean
=end

def substrings(s)
  substrings = []
  (0...s.size).each do |st_idx|
    (st_idx...s.size).each do |end_idx|
      substrings << s[st_idx..end_idx] #if s[st_idx..end_idx].size > 1
    end
  end
  substrings#.select {|substr| !substr.include?('0')}
end

p substrings('110')
# '110'
# 0 1 2
# st_idx = 0
# 0 1 2
# s[0..0] = '1'
# s[0..1] = '11'
# s[0..2] = '110'

# s[1..1] = '1'
# s[1..2] = '10'

# s[2..2] = '0'

# def check_ones_segment(s)
#   substrings = substrings(s)

#   substrings.empty? ? false : true
# end

# p check_ones_segment("110") == true
# p check_ones_segment("1001") == false

puts "More complicated algorithm:"

def substrings(str)
  index = (0...str.size).to_a #=> gives me [0, 1, 2, 3, 4]
  all_slices = index.product(index) #=> gives me [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [4, 0], [4, 1], [4, 2], [4, 3], [4, 4]]
  only_valid_slices = all_slices.reject do |start_index, end_index|
    start_index > end_index # so e.g. when we have [0, 4] and [4, 0], [4, 0] will be rejected
  end
  # so now we have an array of 15 valid/unique slices
  # [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [1, 1], [1, 2], [1, 3], [1, 4], [2, 2], [2, 3], [2, 4], [3, 3], [3, 4], [4, 4]]

  substrings = only_valid_slices.map do |starting_index, ending_index|
    str[starting_index..ending_index] #=> so replace with characters at [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], etc. until [4,4]
  end
  substrings
end

str = "madam"
p substrings(str)

puts "***"

puts "Simpler algorithm:"
str = "madam"
       01234
"m" #---------------> str[0..0]
"ma" #--------------> str[0..1]
"mad" #-------------> str[0..2]
"mada" #------------> str[0..3]
"madam" #-----------> str[0..4]
 "a" #--------------> str[1..1]
 "ad" #-------------> str[1..2]
 "ada" #------------> str[1..3]
 "adam" #-----------> str[1..4]
  "d" #-------------> str[2..2]
  "da" #------------> str[2..3]
  "dam" #-----------> str[2..4]
   "a" #------------> str[3..3]
   "am" #-----------> str[3..4]
   "m" #------------> str[4..4]

def substrings(str)
  substrings = []
  (0...str.size).each do |start_index| #start_index = 0, then 1, 2, 3 and 4
    (start_index...str.size).each do |end_index|
      sub = str[start_index..end_index] # [0..0], [0..1], [0..2]
      substrings << sub # end_index 0, 1, 2, 3, 4
      end
    end
  substrings #=>["a", "am", "amm", "amma", "ammad", "m", "mm", "mma", "mmad", "m", "ma", "mad", "a", "ad", "d"]
end

p substrings('ammad')
p substrings('ewa')
# goal is to get all substrings from the given string.

=begin
https://leetcode.com/problems/longest-palindrome/description/

Given a string s which consists of lowercase or uppercase letters,
return the length of the longest palindrome that can be built with those letters.

Letters are case sensitive, for example, "Aa" is not considered a palindrome here.
Example 1:

Input: s = "abccccdd"
Output: 7
Explanation: One longest palindrome that can be built is "dccaccd",
whose length is 7.
Example 2:

Input: s = "a"
Output: 1
Explanation: The longest palindrome that can be built is "a", whose length is 1.
=end

=begin
## P: Understanding the Problem:

We're given a string. We have to return an integer which represents
the length of the longest palindrome that can be build
by the characters in the given string.

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
  - add 1 to final result
- for all the characters which are larger than one in count and divisible by two
    - add all counts to the final result

## C: Implementing a solution in Code:
=end

# MADAM
def longest_palindrome(str)
  result = 0
  counts = Hash.new(0)
  str.chars.each do |char|
    counts[char] += 1 # gives us a hash which has counted characters. Characters are keys, value tells us how many times a char occured.
  end
  p counts # { "d"=>1, "a"=>2, "m"=>2 } for 'daman' which will become 'madam'
  # check for 1
  result = 1 if counts.values.any?(1) # is there any characters whose count is 1? It will be the middle character in a palindrome.
  counts.values.each do |count|
    result += count if count.even? # because even count means there will be 1 letter on the other side
  end
  result
end

# MADAM
# p longest_palindrome('abccccdd') == 7
# p longest_palindrome('a') #== 1
# p longest_palindrome('damam') #== 5
# p longest_palindrome('wow') == 3
# p longest_palindrome('akayk') == 5
# p longest_palindrome('vicic') == 5
# p longest_palindrome('ewa') == 1
p longest_palindrome('deed') == 4

puts

def longest_palindrome(str)
  result = []
  (str.size).downto(1) do |length| # 5, 4, 3, 2, 1
    str.chars.permutation(length) { |substring| result << substring if substring.reverse == substring }
  end
  result.uniq.max_by { |subarr| subarr.size }.size
end

# p longest_palindrome('abccccdd') == 7
# p longest_palindrome('a') == 1
p longest_palindrome('damam') #== 5
# p longest_palindrome('wow') == 3
# p longest_palindrome('akayk') == 5
# p longest_palindrome('vicic') == 5
# p longest_palindrome('ewa') == 1
#
# As the last example shows, the code will return reliable results when
# the string passed as an argument can become a palindrome at all
# It doesn't return 0 if the string argument cannot become a palindrome
# and this is what I would expect
# so we are working here based on the assumption
# that the string argument passed de facto CAN create multiple palindromes
# and we are looking for the longest one
    