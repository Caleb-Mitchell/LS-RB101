# Problem:
# - Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.
# Input:
# - a string
# Output:
# - an array
# Rules:
# - may assume that the words in the string are seperated by exactly one space
# - may assume that any substring of non-space characters is a word
# * empty string should return empty array
# Algorithm:
# - split string in array_words array
#
# - for word in array_words
#   - set variable length to word size
#   - map word to word << ' ' << length.to_s
# - return length_array

def word_lengths(string)
  array_words = string.split

  array_words.map do |word|
    length = word.size
    word << ' ' << length.to_s
  end
end

puts word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

puts word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

puts word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

puts word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

puts word_lengths("") == []
