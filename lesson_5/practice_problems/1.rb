# Problem:
# - order an array of number strings by descending numeric value
# Input:
# - an array of number strings
# Output:
# - an array of number strings, sorted by descending numeric value
# Algorithm:
# - call sort on the array
# - in the sort block, call to_i on both operands surrounding the spaceship
# operator (general comparison operator)
#
arr = ['10', '11', '9', '7', '8'].sort do |str1, str2|
  str2.to_i <=> str1.to_i
end

p arr
