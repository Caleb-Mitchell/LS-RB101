# frozen_string_literal: true

# P
# i: one argument, a positive integer
# o: the sum of that integer's digits
# rr: not allowed to use any basic looping constructs
# mm: need to take an integer, break it apart into individual integers,
# add those together and return the sum
# E
# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45
# D
# should use an array to store each individual digit
# A
# 1. transform integer in array of chars
# 2. iterage over array elements as integers and add to a sum
# 3. return the sum
# C
# def sum(int)
#   sum = 0
#   int.to_s.chars.each { |i| sum += i.to_i }
#   sum
# end
# def sum(int)
#   arr = int.to_s.chars
#   arr[0].to_i + arr[1].to_i + arr[2].to_i + arr[3].to_i + arr[4].to_i +
#     arr[5].to_i + arr[6].to_i + arr[7].to_i + arr[8].to_i + arr[9].to_i
# end

def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end
puts sum(23)
puts sum(496)
puts sum(123_456_789)
