# Problem:
# - write a method that takes a string, and returns a new string in which every
# character is doubled
# Input:
# - a string
# Output:
# - a new string, with every character doubled
# Rules:
# - return a new string
# - empty string returns a new empty string
# * symbols are also doubled, so is space
# * case is preserved
# Algorithm:
# - split string by chars into array string_chars
# - create empty string doubled_chars
# - for every char in string_chars
#   - concatenate char * 2 to doubled_chars
# - return doubled_chars string

def repeater(string)
  string_chars = string.chars

  doubled_chars = ''

  string_chars.each do |chr|
    doubled_chars << chr * 2
  end

  doubled_chars
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''
