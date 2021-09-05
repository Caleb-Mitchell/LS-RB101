=begin
I:
a string of words seperated by spaces
O:
a string in which the first and last letters of ever word are swapped

R:
assume every word contains at least one letter
assume the string will always contain at least one word
assume that each string contains nothing but words and spaces
* preserve case

A:
For each word in string
  move first char to end
  move now next to last char to beginning
return the string
=end

def swap_first_and_last_chars(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(string)
  swapped_string = string.split.map do |word|
    # word_arr = word.chars
    # word_arr << word_arr.shift
    # word_arr.prepend(word_arr.delete_at(-2))
    # word_arr.join
    swap_first_and_last_chars(word)
  end
  swapped_string.join(" ")
end

puts swap('Oh what a wonderful day it is')

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'
