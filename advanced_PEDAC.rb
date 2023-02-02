=begin
Common Mistakes
- Not enough time spent parsing the problem
- Fuzzy algorithm
- Lack of flexibility
- Lack of syntax fluency
=end

=begin
emphasis should be on algorithm part. Dont rush this
at all. It will make u anxious to not code yet during the 
interview. But then u still need to solve the problem now
in the coding stage while u are coding. Much more difficult.
PEDAC is about reducing the cognitive load. Otherwise, its
too much for the human brain to handle. A good algorithm
takes time and is crystal clear. While coding u might find
that something is off and need to be fixed and updated if needed
must be flexible about this. Lack of syntax fluency-the alg 
might be good but u dont have enough experience with the
language. Coding should be the easiest part. Also look at
methods that are not in LS, to help.
=end

=begin
Given an array of integers 
nums and an integer target, return 
indices of the two numbers such 
that they add up to target
Problem Analysis:
- Goal: understand what you're being asked to do
- Read the problem description
- Identify expected input and output
- Establish rules/requirements/define the boundaries of the problem 
- Ask clarifying questions
- Take your time on this step!
=begin
Algorithm:
- Goal: write out steps to solve the given problem in plain English
- A logical sequence of steps for accomplishing a task/objective
- Start high level, but make sure you've thought through and have provided sufficient detail for working through the most difficult parts of the problem
- Stay programming-language-agnostic
- Can create substeps for different parts or separate concerns into a helper method
- You can (and should) revisit your algorithm during the implementation stage if you need to refine your logic
- Before moving onto implementing the algorithm, check it against a few test cases
Coding:
  test one test case at a time
  test things in irb to give u a solid footing and to fix bugs
  test code as you go, when u add one extra layer
=end
=end

# p two_sum([2, 11, 7, 15], 9) == [0, 2]
# p two_sum([3, 2, 4], 6) == [1, 2]
# p two_sum([3, 3], 6) == [0, 1]

=begin pedac

*************Problem***************************
Overall goal:
initial input: an array of integers, integer target
overall output: an array of integers which are the indicies of the two nums that add up to target

explicit requirements:
write a method named two_sum that accepts two parameters
  one parameter is an array of integers, 
  one parameter is an integer (representing the target)
  no output, only return value

implicit requirements:
arrays can be of any length >= 2
test cases are all inclusive
target will always be the sum of two of the elements in the given array
  so return array should always be a pair of indexes ie [1,3]
elements in both parameters are always integers
only 2 numbers added together to get target
return array will be sorted ascending

questions:

*************Examples and Test cases************
++restate all test cases given
++add edge cases, 0 and empty:
# p two_sum([2, 11, 7, 15], 9) == [0, 2]
# p two_sum([3, 2, 4], 6) == [1, 2]
# p two_sum([3, 3], 6) == [0, 1]
ex: in the first test case, because 2 + 7 = 9,
  it would return [0,2]
*************Data Structure********************
++the steps the data takes in between input 
++and output listed above
array > return array
************Algorithm*************************
Initialize new_arr as a return array

A. Main Method two_sum (array, target)
  1.iterate over array and add each num to the num passed
    one at a time to get a sum (ie: 2 + 11, 2 + 7, 2 + 15)
  2. if sum is equal to target, add index of both the num passed and the num
    to return array
  3. sort return array ascending



=end
=begin

## ERIK
Problem
Given an array of integers and an integer, return the indices of the two integers that add up to the target.

Questions
- what if multiple pairs of numbers sum to the target?
- what if there are no pairs that sum to the target?

Examples
[2, 11, 7, 15], 9
2 + 7 = 9
[0, 2]

[3, 2, 4], 6
2 + 4 = 6
[1, 2]

[3, 3], 6
3 + 3 = 6
[0, 1]

Data Structures
input: an array of integers, and an integer
intermediate: the array of integers
output: an array containing to integers representing indexes

Algorithm
input: an array of integers, nums, and an integer, target >> [2, 11, 7, 15], 9
intermediate: the array of integers
- using nested iteration
- iterate through the indexes of nums, idx1 >> 0
- for each iteration, iterate through the indexes *after* that index, idx2 >> 2
- for each pair indices, check if sum of the elements at those positions equals target >> 2 + 7 == 9
- if so, return the pair of indices as an array [idx1, idx2] >> [0, 2]
output: an array containing to integers representing indexes

Code
def two_sum(nums, target)
  (0...nums.size).each do |idx1|
    (idx1+1...nums.size).each do |idx2|
      return [idx1, idx2] if nums[idx1] + nums[idx2] == target
    end
  end
end
=end

=begin 
## ALEX
Problem:
Explicit requirements: Find the indecies of the two digits in an array that add up to the target integer
Implicit requirements: The indecies must be different

Input: An array of integers and an integer
Output: An array of two integers (the indecies of values in the given array)

Algorithm:

Initialize an array to contain the final indecies

Iterate through each value in the array

- - Select all subsequent values in the array
    - Find the sum of the initial value and each subsequent value
    - if the sum is equal to the target value, add both indecies to the answer array
=end