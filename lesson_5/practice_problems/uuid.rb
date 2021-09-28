# Problem:
# - write a method that returns on UUID when called with no parameters
# Input:
# - nothing
# Output:
# - one UUID
# Rules:
# - a UUID is a string
# - it is in 5 sections of characters delimited by dashes
# - each character should be a random hexadecimal digit
# Algorith:
# - create an empty array
# - create a constant array of hexadecimal digits
# - create a constant array of the dash indices
#
# - 35 times, add a sample from hexa array to the empty array
#   - on the 9th, 14th, 19th, 24rd times add a '-' instead
# - return joined array
HEXADIGITS = ('1'..'9').to_a | ('a'..'f').to_a
DASH_INDICES = [8, 13, 18, 23]

def uuid
  uuid_array = []
  36.times do |i|
    if DASH_INDICES.include?(i)
      uuid_array << '-'
    else
      uuid_array << HEXADIGITS.sample
    end
  end
  uuid_array.join
end

puts uuid
