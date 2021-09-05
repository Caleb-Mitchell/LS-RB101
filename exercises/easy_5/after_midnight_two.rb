=begin
I:
a string, the time of day in 24hr format
O:
the number of minutes before and after midnight, as per each method name

R:
- both methods should return a value in the range 0..1439
- may not use ruby's Date and Time methods

A:
INIT variable representing midnight = 1400

after_midnight
  convert hour value to minutes
  add minutes value to hour=>minutes
  return minutes

before_midnight
  convert hour value to minutes
  add minutes value to hour=>minutse
  subtract from midnight minutes value

=end

def after_midnight(string)
  hour_minutes = (string[0..1].to_i % 24) * 60
  string[3..4].to_i + hour_minutes
end

def before_midnight(string)
  hour_minutes = (string[0..1].to_i % 24) * 60
  if 1440 - (string[3..4].to_i + hour_minutes) == 0 ||
     1440 - (string[3..4].to_i + hour_minutes) == 1440
    1440 % (1440 - (string[3..4].to_i + hour_minutes))
  else
    1440 - (string[3..4].to_i + hour_minutes)
  end
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
