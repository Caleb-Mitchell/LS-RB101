# Problem:
# - Write a method that returns true if the word passed in as an argument can be
# spelled from this set of blocks, false otherwise.
# Input:
# - a word
# Output:
# - true or false
# Rules:
# - there are specific blocks, each with two letters
# - each block can only be used once
# - you cannot use both letters from one block
# * case does not matter
# Data Structure:
# - nested array
# Algorithm:
# - create array
# - split word into downcase chars
# - for char in chars
#   - for block in blocks
#     - if block includes letter
#       - remove block from blocks
#       - next
#     - else
#       return false
#   return true if block includes last letter

def block_word?(word)
  blocks = [['b', 'o'], ['x', 'k'], ['d', 'q'], ['c', 'p'], ['n', 'a'],
            ['g', 't'], ['r', 'e'], ['f', 's'], ['j', 'w'], ['h', 'u'],
            ['v', 'i'], ['l', 'y'], ['z', 'm']]

  chars = word.downcase.split(//)
  chars.each do |char|
    blocks.each do |block|
      return true if block.include?(char) && char == chars.last

      blocks.delete(block) if block.include?(char)
    end
  end
  false
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true
