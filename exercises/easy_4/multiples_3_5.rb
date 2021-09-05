=begin
I:
one integer, the top of a range
O:
an integer, the sum of all multiples of 3 or 5 in that range

R:
- the number passed in is an integer greater than 1
* the multiples are inclusive of the top number of the range
  - i.e. if the top of the range is 5, 5 will be included in the sum

MM:
with a given range of postive numbers, find all multiples of 3 or 5 within that
range, and add them together

DS:
array to hold the mulitples

A:
INITIALIZE empty array
FOR each number in range 1 to PASSED INTEGER
  IF number % 3 == 0 OR number % 5 == 0, push to array
COMPUTE sum of all numbers in array
RETURN SUM
=end

def multisum(int)
  array = []
  1.upto(int).each { |num| array.push(num) if num % 3 == 0 || num % 5 == 0 }
  array.reduce(:+)
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
