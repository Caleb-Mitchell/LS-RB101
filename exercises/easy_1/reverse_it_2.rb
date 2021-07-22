# frozen_string_literal: true

# P
# input: one argument, a string containing one or more words
# output: the given string, with words that contain five or more characters reversed
# rr:
# 1. words with 4 or less characters stay the same
# 2. each string will consist of only letters and spaces
# 3. spaces should be included only when more than one word is present
# mm:
# given a string of words, reverse words 5 or more chars long, return the new string
# E
# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS
# D
# can use an array to store each word in the string, to easily iterate over 
# only the words that are 5 or more chars long
# A
# 1.store the string in an array
# 2. split by spaces
# 3. iterate over elements, reverse word only if 5 or more chars
# 4. join back together by space
# 5. return new string (implicit)
# C
def reverse_words(string)
  words = string.split(' ')
  words.map { |word| word.length >= 5 ? word.reverse : word }.join(' ')
  # new_arr = arr.map do |word|
  #   if word.length >= 5
  #     word.reverse
  #   else
  #     word
  #   end
  # end
  # new_arr.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
