# Program:
# - Write a method that returns a list of all substrings of a string that start
# at the beginning of the original string. The return value should be arranged
# in order from shortest to longest substring.
# Input:
# - a string
# Output:
# - an array, with substrings of the array provided, ordered from shortest to
# longest
# Rules:
# - substrings all built upon first charcter of original string, adding one
# * should i be able to deal with multiple words?
# character at a time
# Data structure:
# - array returned with substrings
# Algorithm:
# - split string by chars, store in string_array
# - initialize empty array to store substrings
# - for char in array of chars,
#   - initialize substring variable to ''
#   - initialize accumulator variable to ''
#   - push char to substring
#   - push substring to accumulator
#   - push accumulator to string_array
# - return string_array
def leading_substrings(string)
  chars = string.chars
  sub_string = ''
  string_array = []
  chars.each do |chr|
    sub_string += chr
    string_array.push(sub_string)
  end
  string_array
end

puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

