# Problem:
# - Write a recursive method that computes the nth Fibonacci number, where nth
# is an argument to the method.
# Input:
# - an integer, the nth fibonacci number to compute to
# Output:
# - the value of the nth fibonacci number
# Algorithm:
# - base case = return num if num == 2

def fibonacci(num)
  return 1 if num <= 2

  fibonacci(num - 1) + fibonacci(num - 2)
end

puts fibonacci(1) == 1
puts fibonacci(2) == 1
puts fibonacci(3) == 2
puts fibonacci(4) == 3
puts fibonacci(5) == 5
puts fibonacci(12) == 144
puts fibonacci(20) == 6765
