=begin
I:
- one string
O:
- a new string that contains the value of the original string with all
consecutive duplicate characters collapsed into a single character

R:
- may not use String#squeeze or String#squeeze!
- an empty string should return an empty string
* should we return the original string object or a new string object?

D:
- array to hold the chars so we can iterate through them?

A:
- INIT a new string
- FOR each char in original string
  - add it to new string, unless the last char in new string is the char
- Return the new string

=end

# def crunch(string)
#   new_string = []

#   string.chars.each do |letter|
#     new_string << letter unless new_string.last == letter
#   end

#   new_string.join
# end

def crunch(text)
  index = 0
  crunch_text = ''
  while index < text.length
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
puts crunch('ddaaiillyy ddoouubbllee')
puts crunch('4444abcabccba')
puts crunch('ggggggggggggggg')
puts crunch('a')
puts crunch('')
