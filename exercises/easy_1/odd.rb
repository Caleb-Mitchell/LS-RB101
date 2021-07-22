# frozen_string_literal: true

# P
# input: one integer argument (postive, negative, or zero)
# output: boolean
# requirement: may assume that the argument is a valid integer value
# rule: cannot use #odd? or #even?
# mm: given one integer argument, return true if the number is odd
#
# E
# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true
#
# D no data structure
# A
# check to see if integer is odd
# return true if it's odd
# return false if it's even
def is_odd?(number)
  number *= -1 if number.negative? # FE: option if you weren't certain whether % were the modulo or remainder operator
  number % 2 == 1
  # number.remainder(2) == 1
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
