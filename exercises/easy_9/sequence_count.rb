# Problem:
# - Create a method that takes two integers as arguments. The first argument is
# a count, and the second is the first number of a sequence that your method
# will create. The method should return an Array that contains the same number
# of elements as the count argument, while the values of each element will be
# multiples of the starting number.
# Input:
# - two integers
# Output:
# - an array
#   - number of elements is first int argument
#   - elements are multiples of second int argument
# Rules:
# - count argument will always have a vale of 0 or greater
# - starting number can be any integer value
# - if count is 0, empty list should be returned
# Algorithm:
# - create empty array sequence
# - from range 1 to count argument times
#   - push multiple argument * index to sequence
# - return sequence

def sequence(count, multiple)
  sequence_arr = []

  1.upto(count) do |idx|
    sequence_arr << (idx * multiple)
  end

  sequence_arr
end

puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []
