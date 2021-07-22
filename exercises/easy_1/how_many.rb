# frozen_string_literal: true

# P
# input: 1 array
# output: each element, and a count of it's occurences, on a seperate line for each
#
# requirements: the given array
# rule: word in the array are case-sensitive
#
# mental model: given an array of words, track how many times
# each word is present, and print the number of occurences of each
#
# E
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
#
# D
# should use an array, with the words as keys
# and the number of occurences as values
#
# A
# 1. create a dictionary with a default value of 1 for each key
# 2. if a word is not in the dictionary, add it
# 3. if a word is not in the dictionary, update it's value by 1
# 4. iterate the dictionary, printing the keys and values
#
# C
def count_occurrences(array)
  occurences = {}

  array.each do |element|
    if occurences.include?(element)
      occurences[element] += 1
    else
      occurences[element] = 1
    end
  end

  # better than above
  # array.uniq.each do |element|
  #   occurrences[element] = array.count(element)
  # end

  occurences.each { |key, value| puts "#{key} => #{value}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
