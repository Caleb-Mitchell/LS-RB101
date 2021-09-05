NUMS = {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
}

def int_to_string(int)
  string = ''
  int.digits.reverse.each { |num| string << NUMS[num] }
  string
end

def signed_int_to_string(int)
  return '0' if int == 0

  if int.positive?
    int_to_string(int).prepend('+')
  else
    int_to_string(-int).prepend('-')
  end
end

puts signed_int_to_string(4321) == '+4321'
puts signed_int_to_string(-123) == '-123'
puts signed_int_to_string(0) == '0'
