# medium 2 unlucky days
require 'date'

def friday_13th(year)
  array = []
  
  (1..12).each do |month|
    if Date.new(year, month, 13).friday?
      array << month
    end
  end

  array.count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

def friday_13th(input)
  month = 1
  counter = 0

  loop do
    if Date.new(input, month, 13).friday? == true
    counter += 1
    end

    month += 1
    break if month == 13
  end
  # p counter
end

=begin  Medium 2 lettercase ratios
In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

Examples:
letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

=end 

=begin pedac

*************Problem***************************
Overall goal: return a hash that analyzes the string: %char that are lowercase, % uppercase, % neither upper or lowercase
initial input: string
overall output: hash with 3 key value pairs

explicit requirements:
  string has >= 1 character
  string can have upper, lower and non alphabetical characters
    need to get % of total for each subset (upper, lower and non)


implicit requirements:
space is counted as a non alphabetical char
percents are returned as floats including tenths place
keys are symbols 'lowercase:, uppercase: and neither:' values are percent
questions:

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:
letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 } 
  10 char total, 5 lower, 1 upper, 4 neither => 5/10 * 100 = 50.0, 1/10*100 = 10.0, 4/10*100 = 40.0
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
  total char = 3. lower = 0 => 0.0, upper = 0 => 0.0, neither = 3 => 3/3 * 100 = 100.0


*************Data Structure********************
string > hash
************Algorithm*************************
A. High Level Algorithm
  1.given a string
  2. count number of characters
  3.count number of lowercase character
  4. count number of upperase characters
  5. count number of non alphabetical characters
  7. calculate % for each subset
  8. assigning keys and values for a new hash
B Detailed Algorithm
  1. given a string
  2. count num of chars using size and assign to `total_chars`.
  3. use count with a block  with if/else to count uppercase, lowercase, neither and assign to local vars
  4. initiate return_hash
  5. return_hash key 'upperase' assigned to return value of (upperase/total) * 100 to float
  6. return_hash key `lowercase`  assigned to return value of (lowercase/total) * 100 to float
  7. return_hash key 'neither' assigned to return value of 
    (neither/total) * 100 to float
=end

def letter_percentages(string)
  uppercase = []
  lowercase = []
  neither = []
  return_hash = {}
  total_chars = string.size
 
  string.each_char do |letter|
    if ('A'..'Z').to_a.include?(letter)
      uppercase << letter
    elsif ('a'..'z').to_a.include?(letter)
      lowercase << letter
    else
      neither << letter
    end
  end

  uppercase = uppercase.count
  lowercase = lowercase.count
  neither = neither.count

  return_hash[:uppercase] = (uppercase / total_chars.to_f * 100)
  return_hash[:lowercase] = (lowercase/total_chars.to_f) * 100
  return_hash[:neither] = (neither/total_chars.to_f) * 100

  return_hash
end


p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 } 

p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }