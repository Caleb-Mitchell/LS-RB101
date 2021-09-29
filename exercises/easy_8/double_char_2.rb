# Problem:
# - Write a method that takes a string, and returns a new string in which every
# consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and
# whitespace should not be doubled.
# Input:
# - a string
# Output:
# - a new string with doubled consonants
# Rules:
# - only double consonants
# Algorithm
# - split string by chars
# - create empty string double_cons
# - for every char in split char array
#   - if char is a consonant, concatenate with double_cons * 2
#   - else, concatenate with double_cons without double
# - return double_cons

def double_consonants(string)
  double_cons = ''

  string.each_char do |chr|
    if chr.match?(/[b-df-hj-np-tv-z]/i)
      double_cons << chr * 2
    else
      double_cons << chr
    end
  end

  double_cons
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""
