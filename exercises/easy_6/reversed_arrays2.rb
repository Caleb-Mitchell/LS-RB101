# ====PEDAC====
# Problem:
# (restate certain elements)(problem domain)
# - write a method that takes an array, and returns a new array with the elemets
# of the original list in reverse order, do not modify the original list
# Input: an array
# Output: a NEW array, with the elements of the original list reversed
# Rules:
#   Explicit:
#   - must return a new array
#   - may not use Array#reverse or Array#reverse!, or the method in the previous
#   exercise
#   (Questions?)
#   Implicit:
#   -
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
# - create a new, empty array
# - set counter to -1
# - begin loop
#   - break if counter value made positive is equal to size of original array
#   - add value at index counter of original array to new array
#   - decrement counter by 1
# - return new array
# C(ode, with intent):
# (Create any necessary Test Cases)

# def reverse(list)
  # new_list = []
  # counter = 0

  # loop do
    # break if -counter == list.size

    # counter -= 1
    # new_list << list[counter]
  # end
  # new_list
# end

def reverse(list)
  list.each_with_object([]) do |item, array|
    array.unshift(item)
  end
end

puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true

