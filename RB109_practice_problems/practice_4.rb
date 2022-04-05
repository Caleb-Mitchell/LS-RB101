# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Examples:

def closest_numbers(array)
  array.combination(2).to_a.min_by { |arr| (arr.first - arr.last).abs }
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".
