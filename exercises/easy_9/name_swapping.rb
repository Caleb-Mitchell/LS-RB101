# Problem:
# - Write a method that takes a first name, a space, and a last name passed as a
# single String argument, and returns a string that contains the last name, a
# comma, a space, and the first name.
# Input:
# - a string
# Output:
# - a string, with elements flipped
# Algorithm:
# - split string and set to name_array
# - concatenate new string
# - return new string

def swap_name(string)
  name_array = string.split

  "#{name_array[1]}, #{name_array[0]}"
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'
