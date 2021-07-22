# frozen_string_literal: false

# P
# input: one argument, a positive integer
# output: a string of alternating 1s and 0s, always starting with 1.
# r:
# 1. the returned string must always start with 1
# 2. the length of the string should match the given integer
# mm:
# start with a positive integer, and convert that to a string of 0s and
# 1s with is the same length as the integer
# E
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'
# D
# don't need an array, will just build a string based on the size of the integer
# A
# 1. create an empty string
# 2. a number of times equal to the integer, add a digit to the new string,
# alternating between 1s and 0s
# 3. return the new string
# C
def stringy(int, alt = 1)
  binary_string = ''
  (1..int).each do |i|
    binary_string += if alt == 1
                       i.odd? ? '1' : '0'
                     else
                       i.even? ? '1' : '0'
                     end
  end
  binary_string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(7, 1) == '1010101'
puts stringy(7, 0) == '0101010'
