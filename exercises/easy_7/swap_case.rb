# Problem
# - Write a method that takes a string as an argument and returns a new string
# in which every uppercase letter is replaced by its lowercase version, and
# every lowercase letter by its uppercase version. All other characters should
# be unchanged.
# Rules:
# - may not use String#swapcase
# - all non-letter characters should be preserved
# - return a new string
# Data Structure:
# - an array
# Algorithm:
# - split the string into an array, by character
# - for each char in char string
#   - check if LOWERCASE array includes the char
#     - if it does, replace it with the char at the same index of the UPPCASE
#     array
#   - check if UPPERCASE array includes the char
#     - if it does, replace it with the char at the same index of the LOWERCASE
#     array
#   - if not in either constant, leave the char alone
# - join the array back to a string
# - return the string

LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

def swapcase(string)
  chars = string.split(//)
  chars.each_with_index do |char, index|
    if LOWERCASE.include?(char)
      chars[index] = UPPERCASE[LOWERCASE.index(char)]
    elsif UPPERCASE.include?(char)
      chars[index] = LOWERCASE[UPPERCASE.index(char)]
    end
  end
  chars.join
end

puts swapcase ('abcd')
puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
