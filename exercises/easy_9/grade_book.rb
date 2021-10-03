# Problem:
# - write a method that determines the mean (average) of the three scores passed
# to it, and returns the letter value associated with that grade.
# Input:
# - three integers
# Output:
# - a single character string, representing the average of the three integers
# Rules:
# - each letter grade has a corresponding integer range
# - all ints will be between 0 and 100
# - 3 scores exactly
# Algorithm:
# - find average of three ints, save to variable mean
# - depending of mean value, return correct letter

def get_grade(int1, int2, int3)
  mean = (int1 + int2 + int3) / 3.0
  case mean
  when 90..100 then 'A'
  when 80..89 then 'B'
  when 70..79 then 'C'
  when 60..69 then 'D'
  else             'F'
  end
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"
