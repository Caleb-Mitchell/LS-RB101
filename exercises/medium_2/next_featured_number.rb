# Problem:
# - Write a method that takes a single integer as an argument, and returns the
# next featured number that is greater than the argument.
# Input:
# - an integer
# Output:
# - an integer, the next 'featured number' greater than the argument
# Rules:
# - return an error message if there is no next featured number
# - a featured number is an odd number that is a multiple of 7, and whose digits
# occur exactly once each
# Algorithm:
# - save argument value as counter
# - start loop
#   - break if argument meets featured number conditions
#     - odd
#     - multiple of 7
#     - digits occur once each
#   - counter += 1
# - return counter
# - check out error message for number too high, try to rescue it with error
# message

def featured(num)
  counter = num
  overflow = false

  loop do
    counter += 1

    if counter >= 9_876_543_210
      overflow = true
      break
    elsif counter.odd? &&
          (counter % 7).zero? &&
          counter.digits == counter.digits.uniq
      break
    end
  end

  if overflow == true
    puts 'There is no possible number that fulfills those requirements'
  else
    counter
  end
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987

puts featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
