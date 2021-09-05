=begin
I:
- an array of numbers
O:
- an array with the same number of elements, each element has the running
total from the original array

CQs:
- positive integers only?

R:
* an empty array should return an empty array

MM:
- change an array of integers, to another array of integers in which each int is
the running total instead of the individual values, each subsequent int is the
sum of the previous integer and the next value

D:
arrays

A:
INITIALIZE new empty array
INITIALIZE counter variable
FOR each value in argument array
  add value to counter
  push current counter value to new array
RETURN new array
=end

# def running_total(orig_array)
#   counter = 0
#   new_array = []
#   orig_array.each do |value|
#     counter += value
#     new_array.push(counter)
#   end
#   new_array
# end

# Solution using Enumerable#inject
# INIT empty new_array
# FOR each value in orig_array
#   PUSH sum of value and any values before it in orig_array
# RETURN new_array

# def running_total(array)
#   running_total_array = []
#   count = 0

#   array.each do
#     running_total_array.push(array[0..count].inject(:+))
#     count += 1
#   end
#   running_total_array
# end

def running_total(array)
  running_total_array = []
  count = 0

  array.size.times do |i|
    running_total_array.push(array[0..i].inject(:+))
    count += 1
  end
  running_total_array
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
