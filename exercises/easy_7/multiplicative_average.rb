# Problem:
# - write a method that takes an array of integers as input, multiplies all teh numbers togehter, divides the result by the number of entries in the array, and then prints the result rounded to 3 decimal places.
# Input:
# - an array of integers
# Output:
# - a float, rounded to 3 decimal places
# Rules:
# - the array is non-empty
# * round? not truncate?
# Algorithm:
# - for each object in array
#  - multiply them all together
#  - set result to total
# - display total as float rounded to three dec places

def show_multiplicative_average(array)
  multiplied_total = array.reduce(:*)
  average = multiplied_total / array.size.to_f
  puts "#{format("%.3f", average)}"
end

puts show_multiplicative_average([3, 5])                # => The result is 7.500
puts show_multiplicative_average([6])                   # => The result is 6.000
puts show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
