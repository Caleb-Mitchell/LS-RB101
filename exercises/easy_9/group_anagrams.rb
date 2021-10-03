# Problem:
# - given an array of words, write a program that prints out groups of words
# that are anagrams.
# Input:
# - an array of words
# Output:
# - multiples arrays, one per output line, which contain anagrams found within
# the original array
# Alorithm:
# - create hash anagrams
# - for each word in array
#   - check to see if anagrams hash already has sorted word as key
#     - if it does, add the word as a value, set to the sorted key
#     - if it does not, add the sorted word as a key, set to the word as value
# - print the values in anagrams

def group_anagrams(array)
  anagrams = {}

  array.each do |word|
    key = word.chars.sort.join

    if anagrams.key?(key)
      anagrams[key] << word
    else
      anagrams[key] = [word]
    end
  end

  anagrams.values.each { |sub_array| p sub_array }
end

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
         'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
         'flow', 'neon']

group_anagrams(words)
