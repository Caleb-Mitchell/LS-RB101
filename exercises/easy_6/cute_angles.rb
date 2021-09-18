# ====PEDAC====
# Problem:
# (restate certain elements)(problem domain)
# - 
# Input: a floating point number
# Output: a string, representing an angle
# Rules:
#   Explicit: 
#   - use specific formatting to display the angle
#   - 1 degree = 60 minutes, 1 minute = 60 seconds
#   (Questions?)
#   Implicit:
#   - 
# Mental Model: take a floating point number, integer value (before decimal point) is the 
# degrees, multiply decimal value by 60, integer value of that is the minutes, multiply decimal
# value by 60, result is the seconds
# - 
# Examples:
# (test cases - 0, emptiness, boundary conditions, repitition/duplication,
# upper/lower case, data types, raise exceptions/report errors, special values)
# (edge cases - negative numbers, 0, extremely high values)
# - 
# Data Structure:
# - 
# Storm:
# - might want to initialize constants for the values of degrees and minutes
# - we want to use sprintf
# Algorithm:
# - initialize variable degrees
#     - set to float argument, after calling truncate method
# - initialize variable minutes
#     - set to ((float argument % degrees) * 60).truncate
# - initialize variable seconds, after calling truncate on minutes
#     - set to (((float argument % degrees) * 60) % (float argument % degrees).truncate) * 60).truncate
# C(ode, with intent):
# (Create any necessary Test Cases)

DEGREE = "\xC2\xB0"

def dms(float)
  degrees = float.truncate
  # puts degrees
  minutes = ((float % degrees) * 60).truncate
  # puts minutes
  # seconds = ((((float % degrees) * 60) % (float % degrees).truncate) * 60).truncate
  
  seconds = (((float % degrees) * 60) % minutes.truncate * 60).truncate
  # puts seconds
  
  puts "%(#{sprintf("%02d", degrees)}#{DEGREE}#{sprintf("%02d", minutes)}\'#{sprintf("%02d", seconds)}\")"
end

  #seconds = (((float % degrees) * 60) % minutes.truncate * 60).truncate

  # seconds = ((float % degrees) * 60) % minutes.truncate * 60


dms(76.73)

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
