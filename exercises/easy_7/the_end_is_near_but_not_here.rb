# Problem:
# - Write a method that returns the next to last word in the String passed to it as an argument.
# Input:
# - a string
# Output:
# - a string, that is the next to last word of the input string
# Rules:
# - words are any sequence of non-blank characters
# - may assume that the input string will always contain at least two words
# * is it alright to return a new string object?
# * it looks like case should be preserved
# Algorithm:
# - split words of string into an array
# - return the word that is 2 indices in from the end
def penultimate(string)
  words = string.split
  words[-2]
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'
