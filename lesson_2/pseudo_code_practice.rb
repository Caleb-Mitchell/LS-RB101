# 1. a method that returns the sum of two integers
#
# casual
# ask for first integer from user
# ask for second integer from user
# add the two integers together
# return the sum
#
# formal
# START
#
# PRINT Please give me one integer
# GET integer_1
#
# PRINT Please give me another integer
# GET integer_2
#
# SET sum = integer_1 + integer_2
#
# PRINT sum
#
# END
#
# 2. a method that takes an array of strings, and returns a string that is all those strings
# concatenated together
#
# casual
# initialize an empty string
# iterate over array of strings
# for each element in array, add value to empty string
# return new string
#
# formal
# START
#
# given an array of strings
#
# SET new_string = empty
# SET iterator = 1
#
# WHILE iterator <= size of array
#   new_string = new_string + value within array of strings at space "iterator"
#   iterator = iterator + 1
#
# PRINT new_string
#
# END
#
# 3. a method that takes an array of integers, and returns a new array with every other element
#
# casual
# initialize new empty array
# iterate over integer array
# add every other integer from integer array to new array
# return new array
#
# formal
# START
#
# given an array of integers
#
# SET new_array = empty
# SET iterator = 1
#
# WHILE iterator <= size of array of integers
#   IF iterator is odd
#     new_array = new_array + value within array of integers at space "iterator"
#   ELSE
#     go to the next iteration
#
#   iterator = iterator + 1
#
#  PRINT new_array
#
#  END
