# Problem:
# - write a method that can rotate the last n digits of a number.
# Input:
# - an integer, and the number of digits at the end of the int to rotate
# Output:
# - an integer, with digits rotated
# Rules:
# * just integers, no floats?
# Algorith:
# - tranform the int into an array
# - split the array into two arrays, at the -nth index
# - call rotate_array on the latter array
# - combine the two arrays
# - return the combined array

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(int, n)
  # array = int.digits.reverse
  # parted_arr = array.partition.with_index { |_, idx| idx < (array.size - n) }
  # (parted_arr[0] + rotate_array(parted_arr[1])).join.to_i
  all_digits = int.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917
