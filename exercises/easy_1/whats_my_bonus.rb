# frozen_string_literal: true

# P
# i: two arguments, a positive integer and a boolean
# o: one integer
# mm: if the boolean is true, return a number half of the integer provided
# if it's false, return 0
# E
# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000
# A
# 1. return 0 if bool is false
# 2. return int / 2 if bool is true
# C
def calculate_bonus(int, bool)
  bool ? int / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
