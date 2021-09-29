# Problem:
# - Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.
# Input:
# - an integer
# Output:
# - an array
# Rules:
# - may assume that the argument will always be a valid integer that is greater
# than 0
# Algorithm:
# - create empty array int_array
# - from range 1 to integer argument
#   - push each number to int_array
# - return int_array

def sequence(int)
  int_array = []

  1.upto(int) { |num| int_array << num }
  int_array
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]
