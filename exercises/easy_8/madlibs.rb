# Problem:
# - create a simple mad-lib program that prompts for a noun, a verb, an adverb,
# and an adjective and injects those into a story that you create
# Input:
# - several strings
# Output:
# - a sentence, using those strings interpolated
# Data Structure:
# - none, just variables necessary
# Algorithm:
# - ask user for noun
# - store user input in variable noun
# - ask user for verb
# - store user input in variable verb
# - ask user for adjective
# - store user input in variable adjective
# - ask user for adverb
# - store user input in variable adverb
# - display sentence with variables inserted via string interpolated
def madlib
  print "Enter a noun: "
  noun = gets.chomp

  print "Enter a verb: "
  verb = gets.chomp

  print "Enter an adjective: "
  adjective = gets.chomp

  print "Enter an adverb: "
  adverb = gets.chomp

  puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
end

madlib
