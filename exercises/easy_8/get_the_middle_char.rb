# Problem:
# - write a method that takes a non-empty string argument, and returns the
# middle character or characters of the argument. if the argument has an odd
# length, you should return exactly on character. if the argument has an even
# length, you should return exactly two characters.
# Input:
# - a non-empty string
# Output:
# - a string containing the middle char or chars of the input string
# Rules:
# - if odd, return one char, if even, return two chars
# - string is non-empty
# - observe spaces
# * observe symbols?
# * return new string or same string object?
# * preserve case?
# Algorithm:
# - create variable middle_char = ''
# - split string by chars into array string_chars
# - if string_charss size is odd
#   - middle_char << string_chars[(string_chars.size / 2) + 1]
# - if string_chars size is even
#   - middle_char << string_chars[string_chars.size / 2] <<
#   string_chars[(string_chars.size / 2) + 1]
# - return middle_char

def center_of(string)
  # middle_char = ''

  # string_chars = string.chars
  # middle_index = string_chars.size / 2

  # if string_chars.size.odd?
  #   middle_char << string_chars[middle_index]
  # elsif string_chars.size.even?
  #   middle_char << string_chars[middle_index - 1]
  #   middle_char << string_chars[middle_index]
  # end


  middle_index = string.size / 2

  if string.size.odd?
    string[middle_index]
  elsif string.size.even?
    # Second number in slice is number of elements, not end point
    string[middle_index - 1, 2]
  end
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
