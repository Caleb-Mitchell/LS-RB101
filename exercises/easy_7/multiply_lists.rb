# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

# Brainstorm: each_with_index? map with index?

# Input: Two arrays of same size containing numbers
# Output: One array containing product of each pair of input arrays with same index

# Data Structure: array

# Algorithm: 
# - For each element (with index) in array1
#   - multiply element at index idx in array 2 with element at index idx in array 1
# - Return array

def multiply_list(array1, array2)
  array1.map.with_index { |num, idx| array1[idx] * array2[idx] }
end

p multiply_list([3, 5, 7], [9, 10, 11])


#paired!
# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

# Brainstorm: each_with_index? map with index?

# Input: Two arrays of same size containing numbers
# Output: One array containing product of each pair of input arrays with same index

# Data Structure: array

# Algorithm: 
# - For each element (with index) in array1
#   - multiply element at index idx in array 2 with element at index idx in array 1
# - Return array

# Original Solution:
# def multiply_list(array1, array2)
#   array1.map.with_index { |num, idx| array1[idx] * array2[idx] }
# end

def multiply_list(array1, array2)
  array1.zip(array2).map { |subarray| subarray.inject(:*) }
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# haha it makes so much rmore sense to type in here, lol with zip??
# nice leave this up plzzz
# i just looked at my original solution and i did exactly that lol

# yeah with zip for the further exploration
# I'll leave this up like this!
