# frozen_string_literal: true

# P
# input: 2 arguments, a string and a positive integer
# output: the string printed to the string pos_int number of times, with newlines
#
# requirements/rules: the method takes only two arguments, and the integer is positive
#
# mental model: determine a string to be printed, and print it on new lines a specific number of times
#
# E
# string = 'hello'
# pos_int = 2
#
# hello
# hello
#
# D (no data structure)
# A
# 1. iterate through through the range of 1-pos_int and print the string each time
#
# C code
def repeat(string, pos_int)
  pos_int.times { puts string }
end

repeat('hello', 3)
