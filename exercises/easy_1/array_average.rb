# frozen_string_literal: true

# P
# i: one argument, an array containing integers
# o: an integer, the average of all numbers in the array
#
# rr:
# 1. the array will never be empty
# 2. numbers will always be positive
# 3. result must be an integer
#
# mm: take an array of integers, add them all together and divide by the size of the array
# to find their average, and return the average
#
# E
# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40
# D
# given an array, don't need to create another
# A
# 1. create a new variable, sum, and add each value in array to it
# 2. create result, set value to sum divided by size of the original array
# 3. return result
# C
def average(array)
  sum = 0.0
  array.each { |num| sum += num }
  # below could replace above two lines
  # sum = numbers.reduce { |sum, number| sum + number }
  sum / array.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
