# Problem:
# - Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.
# Input:
# - an integer
# Output:
# - an integer
# Rules:
# - output should be the input * 2, unless the argument is a double number
# - if argument is a double number, return it as is
# * no empty arguments
# * no floats?
# Data Structure:
# - an array to hold digits and check if double number
# Algorithm:
# - check if number is a double number
# - if number is a double number
#   - return number
# - if number is not a double number
#   - return number * 2
#
# - double_number?
#   - call digits on number to create array of digits
#   - if array size is odd, return false
#   - if left half of array is the same as the right half of array, return true
#     - slice index 0 through array.size divided by 2
#   - if not, return false

def double_num?(num)
  num_array = num.digits

  if num_array.size.odd?
    false
  else
    partition_array = num_array.partition.with_index do |_, idx|
      idx < num_array.size / 2
    end

    partition_array[0] == partition_array[1]
  end
end

def twice(num)
  double_num?(num) ? num : (num * 2)
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10
