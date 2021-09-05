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

def signed?(string)
  string.start_with?('+', '-')
end

def string_to_integer(string)
  if signed?(string)
    sign = string[0]
    string[0] = ''
    chars_array = string.chars
    chars_array.map! { |value| convert_digit(value) }
    int = array_to_int(chars_array)
    if sign == '+'
      int
    else
      int * -1
    end
  else
    chars_array = string.chars
    chars_array.map! { |value| convert_digit(value) }
    int = array_to_int(chars_array)
  end
end

puts string_to_integer("-540")
puts string_to_integer('4321') == 4321
puts string_to_integer('-570') == -570
puts string_to_integer('+100') == 100
