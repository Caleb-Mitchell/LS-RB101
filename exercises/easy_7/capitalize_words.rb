=begin
problem:
- write a method that takes a single string argument and returns a new string
that contains the original value of the argument with the first character of
every word capitalized and all othe letters lowercase
input:
- a single string
output:
-the original string value, with the first character of every word capitalized
rules: - new string must contain the original value of the argument (not
necessarily the same object)
- words are any sequence of non-blank characters
* seems that any symbols (like double quotes) must be preserved
Data structure:
- array to hold the split string
Algorithm:
- split string by spaces into array
- for reach word in array
  - capitalize the first letter, lowercase the rest
- join the word array back into a string
- return the string
=end

def word_cap(string)
  string.split.each(&:capitalize!).join(' ')
  # using map might be more idiomatic as it
  # is for tranformation
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
