def palindromic_number?(int)
  int == int.digits.join.to_i
end

# Launch school answer, simply convert to string, then check as before with
# .reverse
#
# def palindromic_number?(number)
#   palindrome?(number.to_s)
# end

# def palindrome?(str)
#   str == str.reverse
# end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
puts palindromic_number?(005) == true
