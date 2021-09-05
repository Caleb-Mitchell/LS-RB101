=begin
Inputs:
- a string
Outputs:
- an integer which is the sum of the ascii values of every char in the string

R:
- use String#ord to determine ASCII value of a char
- empty string should return 0

A:
INIT sum variable
FOR each char in string
  get ascii value with String#ord
  add value to sum
=end

def ascii_value(string)
  sum = 0
  string.chars.each { |char| sum += char.ord }
  sum
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0
