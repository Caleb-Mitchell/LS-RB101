# ====PEDAC====
# Problem:
# (restate certain elements)(problem domain)
# - write a method that takes an array as an argument, and reverses it's
# elements in place. the return value should be the same Array object
# Input: an array
# Output: the same array, with it's elements reversed in place
# Rules:
#   Explicit:
#   - may NOT use Array#reverse or Array#reverse!
#   (Questions?)
#   Implicit:
#   - reverse the elements in array, do not need to reverse individual elements
#   within those elements
#   - empty array should return as same empty array
# Mental Model:
# - reverse the elements of an array in place without using the built-in ruby
# reverse method
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
# - copy array to extra array
#   - create new empty array, and copy values over by iterating over original
#   list
# - initialize counter to -1
#  for each element in the extra array
#   - update element in original array at index of counter
#   - decrement counter by 1
# - return original array
# C(ode, with intent):
# (Create any necessary Test Cases)

def reverse!(list)
  extra_list = []
  list.each { |item| extra_list << item }

  counter = -1

  extra_list.each do |item|
    list[counter] = item
    counter -= 1
  end
  p list
end

list = [1, 2, 3, 4]
result = reverse!(list)
puts result == [4, 3, 2, 1] # true
puts list == [4, 3, 2, 1] # true
puts list.object_id == result.object_id # true

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"] # true
puts list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
puts reverse!(list) == ["abc"] # true
puts list == ["abc"] # true

list = []
puts reverse!(list) == [] # true
puts list == [] # true
