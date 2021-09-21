# ====PEDAC====
# Problem:
# (restate certain elements)(problem domain)
# - write a method that takes a string, and then returns a hash that countains 3
# entries, one represents the number of characters in the string that are
# lowercase letters, one the number of characters that are uppercase letters,
# and one the number of characters that are neither
# Input: a string
# Output: a hash
# Rules:
#   Explicit:
#   - 
#   (Questions?)
#   Implicit:
#   - spaces count as non letters
# Mental Model:
# - 
# Examples:
# (test cases - 0, emptiness, boundary conditions, repitition/duplication,
# upper/lower case, data types, raise exceptions/report errors, special values)
# (edge cases - negative numbers, 0, extremely high values)
# - 
# Data Structure:
# - 
# Storm:
# - can use regex
# Algorithm:
# - create hash with 3 specific values
# - split string into array of chars
# - for each char in array
#   - if a lowercase letter, increment lowercase tally in hash
#   - if an uppercase letter, increment uppercase tally in hash
#   - if not a letter, increment neither tally in hash
# - return the hash
# C(ode, with intent):
# (Create any necessary Test Cases)

def letter_case_count(string)
  hash = { lowercase: 0, uppercase: 0, neither: 0 }

  string.chars.each do |chr|
    if chr.match?(/[a-z]/)
      hash[:lowercase] += 1
    elsif chr.match?(/[A-Z]/)
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
  end
  hash
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

