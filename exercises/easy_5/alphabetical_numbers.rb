# Problem:

# Write a method that takes an Array of Integers between 0 and 19,
# and returns an Array of those Integers sorted based on the English
# words for each number:

# Input:

# Array of integers (0..19)

# Output:

# Array of integers (0..19) (listed in alphabetical order)

# Data Structure:

# Array, Hash

# Algorithm

# Intialize constant ENGLISH containing integers with their english names
# Iterate over array of integers, as new array words
#   For each element, set to corresponding value of ENGLISH
# Sort array words
# Iterate over array words
#   For each element, set to corresponding key of ENGLISH

ENGLISH = {
  0 => 'zero',
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen'
}

def alphabetic_number_sort(integers)
  integers.map { |num| ENGLISH[num] }.sort.map { |word| ENGLISH.key(word) }
end

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# LS implementation
# NUMBER_WORDS = %w(zero one two three four
                  # five six seven eight nine
                  # ten eleven twelve thirteen fourteen
                  # fifteen sixteen seventeen eighteen nineteen)

# def alphabetic_number_sort(numbers)
  # numbers.sort_by { |number| NUMBER_WORDS[number] }
# end
