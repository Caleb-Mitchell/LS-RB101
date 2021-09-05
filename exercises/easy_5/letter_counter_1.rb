=begin
I:
- one string with one or more space seperated words
O:
- one has that shows the number of words of different sizes

R:
- words consist of any string of characters that do not include a space

DS:
- hash

A:
- INIT empty hash
- FOR word in string
  - add to hash as word.size += 1
- RETURN HASH

=end

def word_sizes(string)
  word_size_count = Hash.new(0)

  string.split.each { |word| word_size_count[word.size] += 1 }

  word_size_count
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}

puts word_sizes('Four score and seven.')
puts word_sizes('Hey diddle diddle, the cat and the fiddle!')
puts word_sizes("What's up doc?")
puts word_sizes('')
