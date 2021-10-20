# Problem:
# - write a method that takes an integer as an argument, and returns the maximum
# rotation of that argument
# Input:
# - an integer
# Output:
# - an integer that is the maximum rotation of the integer passed in
# Rules:
# - Should use the rotate_rightmost_digits function
# - Do not have to handle multiple 0s
# Algorithm:
# - call rotate_rightmost_digits for each index in the integer
#
# n needs to go from size of int.digits.reverse to 1
# rotate_rightmost_digits returns an int with digits rotated

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(int, n)
  all_digits = int.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

def max_rotation(int)
  int_size = int.digits.size
  int_size.downto(1) do |n|
    int = rotate_rightmost_digits(int, n)
  end
  int
end


puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
