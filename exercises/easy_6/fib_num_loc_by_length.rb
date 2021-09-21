# ====PEDAC====
# Problem:
# (restate certain elements)(problem domain)
# - write a method that calculates and returns the index of the first Fibonacci
# number that has the number of digits specified as an argument
# Input: the number of digits desired
# Output: the index of the first fibonacci number with that many digits
# Rules:
#   Explicit:
#   - the first fibonacci number has index 1, not 0 (1 index system)
#   - the argument is always greater than or equal to 2
#   (Questions?)
#   Implicit:
#   - only integers
# Mental Model:
# - compute how many fibonacci numbers it takes in the sequence to reach a given
# number of digits
# Examples:
# (test cases - 0, emptiness, boundary conditions, repitition/duplication,
# upper/lower case, data types, raise exceptions/report errors, special values)
# (edge cases - negative numbers, 0, extremely high values)
# -
# Data Structure:
# - array
# Storm:
# - 
# Algorithm:
# - create an array with beginning of fib sequence [1, 1, 2, 3, 5, 8, 13]
# - begin loop
#   - check if digits have already been reached, break if so (how to check
#   number of digits?) (convert last number to array, compare size of array to
#   user digits_input)
#   - populate array with additional fibonacci number until desired digits are reached
#     - add value to end of array, which is the sum of the current last two
#     numbers
# - return size of array
# C(ode, with intent):
# (Create any necessary Test Cases)

def find_fibonacci_index_by_length(num_of_digits)
  fib_array = [1, 1, 2, 3, 5, 8, 13]
  loop do
    break if fib_array[-1].digits.size == num_of_digits
    fib_array << fib_array[-2] + fib_array[-1]
  end
  fib_array.size
end

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847
