=begin Easy 6 Delete vowels

Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
=end

=begin pedac

*************Problem***************************
Overall goal: return an array of the same strings but with vowels removed
initial input: an array of strings
overall output: an array of strings w vowels removed

explicit requirements:
 write a method named removed_vowels
 vowels are a, e i o u. So not y.
 string can be one or more words
 return same array



implicit requirements:
 upper or lower case chars
 given upper case ltr => return upper case ltr
 given lower case ltr => return lower case ltr
 maintain word spacing
questions:
are we returning the same array or new array?
do we need to deal with non alphabetical chars or empty strings?

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz) => a e i o u are removed
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht) => green without e => grn, YELLOW without e and o => YLLW 
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

*************Data Structure********************
array > array

************Algorithm*************************
A. High Level Algorithm
  1. given an array of strings
  2. iterate over the array
  3. delete vowels from each string
  4. return same now mutated array
B Detailed Algorithm
  1. given an array of strings
  2. using each to iterate
  3. use delete! to delete all vowels- both upper and lowercase
  4. return array
=end

def remove_vowels(array)
  array.each do |string|
    string.delete!('aeiouAEIOU')
  end

end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

def find_fibonacci_index_by_length(int)
  fibonacci = [1, 1]

  loop do 
    fibonacci << fibonacci[-1] + fibonacci[-2]
    break if fibonacci.last.to_s.size == int
  end
  fibonacci.size
end

p find_fibonacci_index_by_length(2) #== 7 