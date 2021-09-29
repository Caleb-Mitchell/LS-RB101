# Problem:
# - Write a method that takes a string argument, and returns true if all of the
# alphabetic characters inside the string are uppercase, false otherwise.
# Characters that are not alphabetic should be ignored.
# Input:
# - a string
# Output:
# - a boolean
# Rules:
# - ignore non-alhabetic chars
# Algorithm:
# - for each char in string.chars
#   - if all alphabetic chars are uppercase, return true
#   - if not, return false

def uppercase?(string)
  # char_array = string.chars.select { |chr| chr.match?(/[a-z]/i) }
  # char_array.all? { |chr| chr.match?(/[A-Z]/) }
  # LS
  string == string.upcase
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true
