# Given the nested array, return an array of the cats type that have an 'x' in the name. 


# def diff_cats(arr)
#   return_array = []
  
#   arr.each do |subarray| 
#     subarray.each do |word| 
#       if word.include?('x')
#         return_array << word
#       end
#     end
#   end
#   p return_array
# end

# diff_cats([ ['tuxedo'], ['siamese'], ['sphynx'], ['orange_tabby'] ]) == [ 'tuxedo', 'sphynx' ]
=begin
A: iterate over the outer array using select => new array. 
  iterate over the inner array using map => new array  # [ 'tuxedo', 'sphynx' ]

  asssign return value to `return_array`

=end

# Return true if all of the hahses have a value 'cat', false otherwise 
=begin

P: given an array of hashes, return true if all hashes have 'cat' in them, return false if even 1 hash doesn't have 'cat'
input: an array of hashes
output: boolean
D: array => boolean
A: given an array of hashes
iterate over array to access hash using each
iterate over hash to access k-v- using .all? to check if all contain 'cat'. => true/false -

=end

def find_cats(arr) 

  # [ {'tuxedo' => 'cat', 'siamese' => 'cat'}, {'poodle' => 'dog', 'parrot' => 'bird'}, {'orange_tabby' => 'cat' }]

  arr.all? do |subhash| 
    subhash.all? do |key, value| 
      value == 'cat'
    end 
  end
end





 p find_cats([ {'tuxedo' => 'cat', 'siamese' => 'cat'}, {'poodle' => 'dog', 'parrot' => 'bird'}, {'orange_tabby' => 'cat' }] )  == false 