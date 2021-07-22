# frozen_string_literal: true

# P
# input: one argument, a positive integer.
# output: a list of the digits in the number.
# requirements: the return should be an array.
#
# mm: take a positive integer, and return an array
# where each element is each of the digits of the
# original integer, in the original order.
#
# E
# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true
#
# D
# will use an array
#
# A
# 1. turn integer to string
# 2. call split method on the integer (delimeter is each character)
# 3. iterate over array to turn elements back into integers
#
# C
def digit_list(number)
  arr_strings = number.to_s.split(//)
  arr_strings.map(&:to_i)
  # number.to_s.chars.map(&:to_i) # this one-liner is most idiomatic
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
