=begin
Make a madlibs program that reads in some text from a text file that you have
created, and then plugs in a selection of randomized nouns, verbs, adjectives,
and adverbs into that text and prints it. You can build your lists of nouns,
verbs, adjectives, and adverbs directly into your program, but the text data
should come from a file or other external source. Your program should read this
text, and for each line, it should place random words of the appropriate types
into the text, and print the result.

input: a text file, yaml, which stores a dictionary
  I'll use types of words as keys, and an array of sample words as each value


=end


require 'yaml'

WORDS = YAML.load_file('madlibs.yml')

def word(type)
  WORDS[type]
end

def madlib
  puts "The #{word('adjectives').sample} #{word('colors').sample} " \
    "#{word('nouns').sample} #{word('adverbs').sample} " \
    "#{word('verbs').sample} the #{word('adjectives').sample} " \
    "#{word('colors').sample} #{word('nouns').sample}, " \
    "who #{word('adverbs').sample} #{word('verbs').sample} " \
    "his #{word('nouns').sample} and looks around."
end

madlib
