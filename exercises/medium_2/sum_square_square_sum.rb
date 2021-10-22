# Problem: - Write a method that computes the difference between the square of
# the sum of the first n positive integers and the sum of the squares of the
# first n positive integers.
# Input:
# - an integer
# Output:
# - an integer, the difference
# Algorithm:
# - find sum of all ints in range 1 - n
#   - square that
# - find sum of squared ints in range 1 - n
# find difference between the two

def sum_square_difference(num)
  # sum_square = (1..num).sum**2
  # square_sum = (1..num).map { |ele| ele**2 }.sum

  # sum_square - square_sum

  ((1..num).sum**2) - (1..num).map { |ele| ele**2 }.sum
end


puts sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150
