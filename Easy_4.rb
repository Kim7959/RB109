=begin 
Easy 4, problem 1
Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.
New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

pedac

*************Problem***************************
Overall goal: take a year and determine which century it is in
initial input: integer (year)
overall output: string (number and suffix)

explicit requirements:
write a method named century, takes 1 argument - Integer
determine the century that the year belongs in
add the correct suffix to the century
return the century including suffix as string


implicit requirements:
if century number ends in 1 > st, 2 > nd, 3 > rd, 4-10 > th,   11, 12, 13 > th
so everything ends in a th except centuries ending with 1, 2, 3 and 11-13.
1 > st 
2 > nd 
3 > rd 
4 - 10th > th 
11, 12, 13, > th  
14 - 20 > th 
21 > st 
22 > nd 
23 > rd 
24 to 30 > th  

20 = (20*100 - 99) to 200*100
19 = (19*100 - 99) to 19*100
3 = (3*100 - 99) to 3*100
1 = (1*100 - 99) to 1*100

questions:

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:
century(2000) == '20th'
  years 1901 - 2000  are the 20th century
century(2001) == '21st'
  years 2001 to 2100 are the 21st century
century(1965) == '20th'
  years 1901 - 2000  are the 20th century
century(256) == '3rd'
   years 201 to 300 are the 3rd century
century(5) == '1st'
  1st century is between years 1 and 99

century(10103) == '102nd'

century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

*************Data Structure********************
++the steps the data takes in between input 
++and output listed above
integer > string

************Algorithm*************************
high level
given an Integer that rep the year
determine century the year lies in 
  `century` = year/100 + 1 (integer)
convert `century` to string (20  > '20'
add correct prefix
  if statement
    digits = century/100
  if century.end_with? `1` => century + `st`
    if century.end_with? `2` => century + `nd`
      if century.end_with? `3` => century + `rd`
        if century.end_with? 4-9, 0 => century + `th`
          if century.end_with? 11, 12 ,13 => th
return century + suffix in each branch of if statement
=end

def century(integer)
  century = (integer/100) + 1
  digits = century.to_s

  if digits.end_with?('1')
    return "#{century} + st"
  elsif digits.end_with?('0')
    return "#{century}th"
  end


end

p century(2000) #== '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'

def leap_year?(year)
  if year % 4 == 0 && year % 100 > 0
    return true
  elsif (year % 4 == 0) && (year % 100 == 0) && (year % 400 == 0)
    return true
  else
    return false
  end
end
  
p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true

# =begin leap year part 2 easy 4
# The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.

# Using this information, update the method from the previous exercise to determine leap years both before and after 1752.
# =end
# =begin pedac

# *************Problem***************************
# Overall goal: to update prior program to determine leap years before and after 1752
# initial input: integer (year)
# overall output: boolean (true if year is leap year)

# explicit requirements:
# modify existing program
# if year < 1752,  leap year occur if year % 4 == 0
# if year >= 1752 leap year occurs as per old program


# implicit requirements:

# questions:

# *************Examples and Test cases************
# ++restate all test cases given
# ++add edge cases, 0 and empty:
# leap_year?(2016) == true
# leap_year?(2015) == false
# leap_year?(2100) == false
# leap_year?(2400) == true
# leap_year?(240000) == true
# leap_year?(240001) == false
# leap_year?(2000) == true
# leap_year?(1900) == false
# leap_year?(1752) == true
# leap_year?(1700) == true
# leap_year?(1) == false
# leap_year?(100) == true
# leap_year?(400) == true

# *************Data Structure********************


# ************Algorithm*************************
# A. High Level Algorithm
#   1. if year < 1752 if year % 4 == 0, return true. false otherwise
#   2. if year >= 1752 do prior program
#   3.
# B Detailed Algorithm
#   1.
#   2.
#   3.
# =end

# # def leap_year?(year)
# #   if year >= 1752
# #     if year % 400 == 0
# #       true
# #     elsif year % 100 == 0
# #       false
# #     else
# #       year % 4 == 0
# #     end
# #   else
# #     year % 4 == 0
# #   end
  
# # end

# def leap_year?(year)
#   if year <= 1752 && year % 4 == 0
#     return true
#   else
#     if year % 400 == 0
#       true
#   elsif year % 100 == 0
#     false
#   else
#     year % 4 == 0
#   end
# end
# end

# # string to integer 
# def string_to_integer(str)
#   counter = 0
#   num = 0
#   loop do 
#     num += 1
#     break if num.to_s == str #break returns nil!
#   end
#   # num
# end

# p string_to_integer('4321') #== 4321
# p string_to_intesger('570') #== 570

def string_to_integer(str)
  num = 0
  while num != num.to_s
    num += 1
    if num.to_s == str
       return num
    end 
  end

end


p string_to_integer('4321') == 4321
p string_to_integer('570') == 570