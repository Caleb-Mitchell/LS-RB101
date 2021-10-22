# Rewrite your recursive fibonacci method so that it computes its results without recursion.

# def fibonacci(num)
#   return 1 if num <= 2

#   fibonacci(num - 1) + fibonacci(num - 2)
# end

# 1: 1
# 2: 1
# 3: 1 + 1 = 2
# 4: 1 + 2 = 3
# 5: 2 + 3 = 5
# 6: 3 + 5 = 8
# def fibonacci(num)
#   if num == 1
#     sum = 1
#   elsif num == 2
#     sum = 1
#   else
#     sum = 0
#     num1 = 1
#     num2 = 1
#     3.upto(num) do
#       sum = num1 + num2
#       num1 = num2
#       num2 = sum
#     end
#   end
#   sum
# end

def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

puts fibonacci(1)# == 1
puts fibonacci(2)# == 1
puts fibonacci(3)# == 2
puts fibonacci(4)# == 3
puts fibonacci(5)# == 5
puts fibonacci(12)# == 144
puts fibonacci(20)# == 6765
puts fibonacci(100)
puts fibonacci(100_001)
