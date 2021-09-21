# ====PEDAC====
# Problem:
# (restate certain elements)(problem domain)
# - write a method called include? that takes an array and a search value as
# arguments. this method should return true if the search value is in the array,
# false if it is not. may not use Array#include?.
# Input: an array
# Output: a boolean
# Rules:
#   Explicit:
#   - may not use Array#include?
#   (Questions?)
#   Implicit:
#   - 
# Mental Model
# - create my own implementation of Array#include?
# Examples:
# (test cases - 0, emptiness, boundary conditions, repitition/duplication,
# upper/lower case, data types, raise exceptions/report errors, special values)
# (edge cases - negative numbers, 0, extremely high values)
# -
# Data Structure:
# - array
# Storm:
# -
# Algorithm:
# - FOR each value in the given array
#   - if value is equal to the search value
#     - return true
# - return false
#
# C(ode, with intent):
# (Create any necessary Test Cases)

def include?(array, search_value)
  array.each do |value|
    if value == search_value
      return true
    end
  end
  false
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false
