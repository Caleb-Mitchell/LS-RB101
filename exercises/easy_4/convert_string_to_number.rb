=begin

I:
- a string of numeric characters
O:
- an integer

R:
- may not use String#to_i or Integer()
- do not worry about leading + or - signs
- don't worry about invalid characters
- assume all characters are number
- ANALYZE THE CHARACTERS IN THE STRING

DS:
- maybe an array?

A:
INIT NUMBERS constant of strings
INIT empty array which will hold digits

TRANSFORM string to array of chars
FOR each char in array
  CONVERT DIGIT with method calling case statment
=end

def convert_digit(char)
  case char
  when '0' then 0
  when '1' then 1
  when '2' then 2
  when '3' then 3
  when '4' then 4
  when '5' then 5
  when '6' then 6
  when '7' then 7
  when '8' then 8
  when '9' then 9
  end
end

def array_to_int(int_array)
  int = 0
  int_array.size.times do |i|
    int += int_array.pop * (10**i)
  end
  int
end

def string_to_integer(string)
  chars_array = string.chars
  chars_array.map! { |value| convert_digit(value) }
  array_to_int(chars_array)
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570
