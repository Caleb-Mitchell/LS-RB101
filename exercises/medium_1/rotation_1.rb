# Problem:
# - Write a method that rotates an array by moving the first element to the end of the array.
# Input:
# - an array
# Output:
# - an array
# Rules:
# - do not modify the original array
# - do not use Array#rotate or Array#rotate!
# - returned array should be the same size as the input array
# * implementation should work for any objects being stored in the array
# * empty array should return an empty array?
# Algorithm:
# - create empty array rotated_arr
# - for every index of array greater than 0
#   - push object at index to rotated_arr
# - push element at index 0 to rotated_arr
# - return rotated_arr


def rotate_array(arr)
  # rotated_arr = []
  # arr.each_with_index { |ele, idx| rotated_arr << ele if idx.positive? }
  # rotated_arr << arr[0]
  # rotated_arr
  arr[1..-1] + [arr[0]]
end

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_int(int)
  rotate_array(int.digits.reverse).join.to_i
end

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

puts rotate_string('hello') == 'elloh'

puts rotate_int(12_345) == 23_451

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true

y = 'caleb'
puts rotate_string(y) == 'alebc'
puts y == 'caleb'

z = 56_789
puts rotate_int(z) == 67_895
puts z == 56_789
