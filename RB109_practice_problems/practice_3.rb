# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

def to_weird_case(string)
  # split string into words
  # each word with index
    # each 3 word, uppercase every 2nd char!

  words = string.split
  words.map!.with_index do |word, idx|
    ((idx + 1) % 3).zero? ? capitalize_letters(word) : word
  end
  words.join(' ')
end

def capitalize_letters(word)
  chars = word.split(//)
  chars.map!.with_index do |letter, idx|
    ((idx + 1) % 2).zero? ? letter.upcase : letter
  end
  chars.join
end

# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'
# 
# The tests above should print "true".
