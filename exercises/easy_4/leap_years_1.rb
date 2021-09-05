=begin

I:
any year greater than 0

O:
true if the year is a leap year
false if it is not a leap year

R:
-leap years occue in every year that is evenly divisible by 4,
unless the year is also divisble by 100
-if the year is evenly divisble by 100, then it is not a leap year unless
the year is also evenly divisble by 400
-assume this rule is good for any year greater than year 0
*integers only seems fine for years?

PD:
dates, calendars, leap year

MM:
given a year, use a conditional to see if it's a leap year, and return a boolean

A:
IF year % 4 = 0 AND year % 100 = 0 THEN false
IF year % 4 = 0 AND year % 100 != THEN true
IF year % 100 = 100 AND year % 400 = 0 THEN true
=end

# def leap_year?(year)
#   if year % 4 == 0
#     if year % 100 != 0
#       true
#     elsif year % 100 == 0
#       if year % 400 == 0
#         true
#       else
#         false
#       end
#     end
#   else
#     false
#   end
# end

# test for least common cases first
def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true
