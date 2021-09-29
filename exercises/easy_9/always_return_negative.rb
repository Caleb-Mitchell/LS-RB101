# Problem:
# - Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.
# Input:
# - a number, positive or negative
# Output:
# - the negative of the number if positive, or the original number if 0 or
# negative
# Rules:
# - zero should return zero
# * integers only?
# Algorithm:
# - if number is 0
#   - return 0
# - elsif number is negative
#   - return number
# - else
#   - return -number

def negative(num)
  num <= 0 ? num : -num
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0      # There's no such thing as -0 in ruby
