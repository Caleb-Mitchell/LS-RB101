=begin

I:
a year
O:
the century, a string

rules:
return value should be a string that begins with the century number,
and ends with st, nd, rd, or th as appropriate
*it appears that integers are adequate for years?
*centuries are based on every 100 years

PD:
date, time

MM:
given a year, return a string that is the century for that year

DS:
hash for ordinals

A:
divide by 100, round up for century
concatenate string with ordinal

=end

ORDINALS = {
  0 => 'th',
  1 => 'st',
  2 => 'nd',
  3 => 'rd'
}

def ordinalize(century_num, ordinal)
  century_num.to_s + ORDINALS[ordinal]
end

def century(year)
  century_num = (year / 100.00).ceil
  if century_num % 100 == 11 ||
     century_num % 100 == 12 ||
     century_num % 100 == 13
    ordinalize(century_num, 0)
  elsif century_num % 10 == 0
    ordinalize(century_num, 0)
  elsif century_num % 10 == 1
    ordinalize(century_num, 1)
  elsif century_num % 10 == 2
    ordinalize(century_num, 2)
  elsif century_num % 10 == 3
    ordinalize(century_num, 3)
  end
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
