# Problem:
# - Write a method that returns a list of all substrings of a string that are
# palindromic. That is, each substring must consist of the same sequence of
# characters forwards as it does backwards. The return value should be arranged
# in the same sequence as the substrings appear in the string.
# Input:
# - a string
# Output:
# - an array of all substrings that are palindromic
# Rules:
# - Duplicate
# palindromes should be included multiple times.
# - consider all characters (including symbols)
# - pay attention to case
# * empty array should return empty array
# Algorithm:
# - set array pal_array = []
# - set substring_array to calling substrings on string
# - for each string in substring_array
#   - if string is_palindrome?
#     - push to pal_array
# - return pal_array

def palindrome?(string)
  string == string.reverse && string.size > 1
end

def leading_substrings(string)
  sub_string = ''
  string_array = []

  # chars = string.chars
  # Further exploration, ignore case
  chars = string.downcase.chars

  # chars.each do |chr|
  #   sub_string += chr
  #   string_array.push(sub_string)
  # end
  # Further exploration, ignore non-alphanumeric characters
  chars.each do |chr|
    sub_string += chr if chr.match?(/[a-zA-Z0-9]/)
    string_array.push(sub_string)
  end

  string_array
end

def substrings(string)
  substrings = []

  0.upto(string.size) do |num|
    substrings.push(leading_substrings(string[num..-1]))
  end

  substrings.flatten
end

def palindromes(new_string)
  pal_array = []

  substring_array = substrings(new_string)

  substring_array.each do |str|
    if palindrome?(str) == true
      pal_array << str
    end
  end

  pal_array
end

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
