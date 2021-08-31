def palindrome?(str)
  reverse_str = str.reverse
  str == reverse_str ? true : false
  # one liner
  # str == str.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
puts palindrome?([1, 2, 1]) == true

# further exploration, method which determines whether an array is palindromic
def array_palindrome?(array)
  array == array.reverse
end

puts "--------------"
puts array_palindrome?([1, 2, 3, 4, 5,]) == false
puts array_palindrome?([1, 2, 3, 2, 1]) == true

# further exploration, .reverse works the same on strings and arrays, no change
# necessary!

# ----------------------------------------------

# part 2, method should be case insensitive, and ignore all non-alphanumeric
# characters

def real_palindrome?(str)
  str.downcase.delete("^[a-zA-Z0-9]*$") == str.downcase.reverse.delete("^[a-zA-Z0-9_]*$")
end

# more clean LS implementation which calls the other method within this method
# def real_palindrome?(string)
#   string = string.downcase.delete('^a-z0-9')
#   palindrome?(string)
# end

puts "------------------"
puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false
