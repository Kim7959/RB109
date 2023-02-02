# Intro to PEDAC!

=begin
Algorithm:
- Goal: write out steps to solve the given problem in plain English
- A logical sequence of steps for accomplishing a task/objective
- Start high level, but make sure you've thought through and have provided sufficient detail for working through the most difficult parts of the problem
- Stay programming-language-agnostic
- Can create substeps for different parts or separate concerns into a helper method
- You can (and should) revisit your algorithm during the implementation stage if you need to refine your logic
- Before moving onto implementing the algorithm, check it against a few test cases
=end

=begin
Write a method that takes an array of consecutive letters as input and returns the missing letter.
=end



=begin
# -------------------------------------- Problem ----------------------------
Rules
- Given an array of string chars
- Return the missing char
  - In the opposite case
- Missing char will be at a middle index

# -------------------------------------- Examples ----------------------------
['a','b','c','d','f'] == 'E'
['a','b','c','d','e','f'] - change case of missing letter

idx 0
['O','Q','R','S']
['A','B','C','D'] ...

# -------------------------------------- Data Structure ----------------------------
Input: array of strings
Ouput: single string

Convert array to a string?

# -------------------------------------- Algorithm ----------------------------
- Compare input array to a full array of alphabet characters
  - Create alphabet array
    - ['a', 'b'] ... manually
    - Create a range from an array
      - Assign to local var alphabet

- Compare the input array to alpha array and find missing letter
  - Compare the input array to alpha array


=end

def determine_missing_letter(arr)
  alpha = (arr[0]..arr[-1]).to_a

  alpha.each do |ele|
    return ele.swapcase if !arr.include?(ele)
  end
end

p determine_missing_letter(['a','b','c','d','f']) == 'E'
p determine_missing_letter(['O','Q','R','S']) == 'p'
p determine_missing_letter(["a","b","c","d","f"]) == "E"
p determine_missing_letter(["O","Q","R","S"]) == "p"

=begin Chris pedac template
=begin
*************Problem***************************
*coding goal:

*initial input: 

*overall output:

*explicit requirements:

*implicit requirements:
 
*questions:
 
*************Examples and Test cases************

*restate all test cases given (or write out an example for clarity)

*add edge cases, 0 and empty:

*************Data Structure*********************

**any patterns from test cases, or 
  notable data structure? what kind can i use:

**************Scratch Pad***********************
- 
************Algorithm***************************

A. Main Method (high-level | What is my overarching process)
  1.  


B. sub-methods (code steps in words)
  1.
=end