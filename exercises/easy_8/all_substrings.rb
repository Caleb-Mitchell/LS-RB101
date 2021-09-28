# Problem:
# - write a method that returns a list of all substrings of a string. the
# returned list should be ordered by where in the string the substring begins.
# this means that all substrings that start at position 0 shuld come first, then
# all substrings that start at position 1, and so on. since multiple substrings
# will occue at each position, the substrings at a given position should be
# returned in order from shortest to longest.
# Input:
# - a string
# Output:
# - an array, containing all substrings of the string
# Rules:
# - all substrings that start at position 0 should come first, then 1, then so
# on.
# - Substrings should be returned in order from shortest to longest.
# Algorithm:
# - create empty array substrings
# - for each letter in string
#   - call leading_substrings on letter, pushing return value to substrings
# - return substrings array

def leading_substrings(string)
  sub_string = ''
  string_array = []

  chars = string.chars

  chars.each do |chr|
    sub_string += chr
    string_array.push(sub_string)
  end

  string_array
end

def substrings(string)
  substrings = []

  0.upto(string.size) do |num|
    substrings.push(leading_substrings(string[num..-1]))
  end

  substrings.flatten
end

puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
