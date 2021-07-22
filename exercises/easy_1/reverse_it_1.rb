# frozen_string_literal: false

# P
# input: one argument, a string
# output: a new string with the words in reverse order
# requirements:
# 1. case is preserved, spaces are preserved
# 2. one space should return one space, multiple spaces should also return one space
# mm: need to take a provided sentence, reverse all the words, and print the new sentence string
# E
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''
# D
# will use an array to store the words, and reverse them by sorting with reverse sort
# A
# 1. change the string to an array, with the words as elements
# 2. reverse the elements of the array by sorting
# 3. print the new array to the screen
# C
def reverse_sentence(string)
  arr = string.split(' ').sort { |a, b| b <=> a }
  new_string = ''
  arr.each do |word|
    # if word is last present in array
    new_string << if word == arr.last
                    word.to_s
                  else
                    "#{word} "
                  end
  end
  new_string
end

# this is the ruby way
# def reverse_sentence(string)
#   string.split.reverse.join(' ')
# end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
