=begin
Inputs:
- an integer: the number of minutes before or after midnight
Output:
- a string: the time of days in 24 hour format (hh:mm)

CQs:
- if the number is high enough, it should wrap?

R:
- the method should work with any integer input
- if the number is positive the time is after midnight, if negative,
the time is before midnight

A:
1440 minutes in 24 hours

INIT int number_of_minutes as 1440
INIT input as user_mins
REDUCE user_mins until it is not divisble by 1440, MOD 1440
SUM int input with 1440
CONVERT new value to time
RETURN time as string
=end

def time_of_day(user_mins)
  # 1440 minutes represents the time midnight (24:00)
  time = 1440
  # avoid any wrapping over max of 24 hour change
  converted_minutes = user_mins % 1440
  # Figure new time to display, currently as int
  time += converted_minutes
  # Convert time from num minutes to hh:mm
  hours = (time / 60) - 24
  minutes = time % 60
  "#{format('%02d', hours.to_s)}:#{format('%02d', minutes)}"
end

puts time_of_day(-3)
puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"
