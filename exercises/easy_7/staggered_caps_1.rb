# Problem:
# - write a method that takes a string as an argument, and returns a new string
# that contains the original value using a staggered capitalization scheme in
# which every other character is capitalized, and the remaining characters are
# lowercase.
# Input:
# - a string
# Output:
# - a new string
# Rules:
# - characters that are not letters should not be changed, but count as
# characters when switching between upper and lowercase
# * 1st char is uppercase, 2nd is lower, ...
# * all strings are non-empty?
# Data Structure:
# - array
# Algorithm:
# - split string by chars into array
# - initialize counter to 0
# - for each char in array
#   - if character is not a letter, skip loop and increment counter by 1
#   - if counter is odd, make character uppercase
#   - if counter is even, make character lowercase
#   - increment counter by 1
# - join the array of chars into a string
# - return the string
def staggered_case(string)
  characters = string.chars
  counter = 0
  loop do
    break if counter == characters.size

    if characters[counter].match?(/[^a-zA-Z]/)
      counter += 1
      next
    end

    characters[counter].upcase! if counter.even?
    characters[counter].downcase! if counter.odd?
    counter += 1
  end
  characters.join
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
puts staggered_case('Dumb people are always blissfully unaware of how dumb they really are…{drools}')
puts staggered_case('i always appreciate people that are very selective with their words and dont mind taking extended pauses to find the right wording')
