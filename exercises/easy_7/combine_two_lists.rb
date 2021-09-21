# ====PEDAC====
# Problem:
# (restate certain elements)(problem domain)
# - write a method that combines two arrays passed in as arguments, and returns
# a new array that contains all elements from both array arguments, with the
# elements take in alternation
# Input: two arrays
# Output: one new array
# Rules:
#   Explicit:
#   - may assume that both input arrays are non-empty
#   - may assume they have the same number of elements
#   (Questions?)
#   Implicit:
#   - new array should begin with first value of first array
# Mental Model:
# - 
# Examples:
# (test cases - 0, emptiness, boundary conditions, repitition/duplication,
# upper/lower case, data types, raise exceptions/report errors, special values)
# (edge cases - negative numbers, 0, extremely high values)
# - 
# Data Structure:
# - 
# Storm:
# - 
# Algorithm:
# - create a new empty array
# - 
# C(ode, with intent):
# (Create any necessary Test Cases)

def interleave(array1, array2)
  array1.zip(array2).flatten
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
