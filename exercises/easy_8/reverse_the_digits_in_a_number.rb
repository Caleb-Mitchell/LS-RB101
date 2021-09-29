# Problem:
# - Write a method that takes a positive integer as an argument and returns that
# number with its digits reversed.
# Input:
# - a positive integer
# Output:
# - an integer, with the digits reversed
# Rules:
# * return value will be new integer
# * should not return any leading zeroes in return value
# * one digit will return one digit
# Storm:
# - use digits method to create array of digits
# - call reverse
# Algorithm:
# - call digits on integer to create array of digits (this also reverses)
# - create empty string reverse_int_string
# - for each digit in array
#   - reverse_int_string << digit.to_s
# - reverse_int_string
# return reverse_int_string.to_i

def reversed_number(int)
  reverse_int_string = ''
  int.digits.each do |digit|
    reverse_int_string << digit.to_s
  end
  reverse_int_string.to_i
end

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21 # No leading zeros in return value!
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1
