# PROBLEM: - Write a method that takes a string, and then returns a hash that
# contains 3 entries: one represents the percentage of characters in the string
# that are lowercase letters, one the percentage of characters that are
# uppercase letters, and one the percentage of characters that are neither.
# Input:
# - a string
# Output:
# - a hash with three entries:
#   - the percentage of chars that are lowercase
#   - the percentage of chars that are uppercase
#   - the percentage of chars that are neither
# Rules:
# - string will always contain at least one char
# * percentage is a float rounded to the 10th?
# * spaces and numbers and symbols are 'neither'
# Algorithm:
# - need total chars, uppercase, lowercase, and non-alphabetic
# - init total_chars = 0
# - init uppercase = 0
# - init lowercase = 0
# - init neither = 0
#
# - split string by chars
# - for char in chars
#   - case char
#     when char is lowercase add to counter
#     when char is uppercase add to counter
#     when char is neither add to neither
#     end
#   - set uppercase_percent (uppercase / total_chars)
#   - set lowercase_percent (lowercase / total_chars) 
#   - set neither_percent (neither / total_chars) 
#   - percents = {}
#   - percents[:lowercase] = lowercase_percent
#   - percents[:uppercase] = uppercase_percent
#   - percents[:neither] = neither_percent
#   - return percents

def letter_percentages(str)
  total_chars = 0
  lowercase_chars = 0
  uppercase_chars = 0

  chars = str.split(//)
  chars.each do |char|
    case
    when char.match?(/[a-z]/) then lowercase_chars += 1
    when char.match?(/[A-Z]/) then uppercase_chars += 1
    end
  end
  total_chars = chars.size
  neither_chars = total_chars - (lowercase_chars + uppercase_chars)

  lowercase_percent = (lowercase_chars / total_chars.to_f) * 100
  uppercase_percent = (uppercase_chars / total_chars.to_f) * 100
  neither_percent = (neither_chars / total_chars.to_f) * 100

  percents = {}
  percents[:lowercase] = sprintf("%.1f", lowercase_percent).to_f
  percents[:uppercase] = sprintf("%.1f", uppercase_percent).to_f
  percents[:neither] = sprintf("%.1f", neither_percent).to_f
  percents
end


puts letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
puts letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
puts letter_percentages('abcdefGHI')
