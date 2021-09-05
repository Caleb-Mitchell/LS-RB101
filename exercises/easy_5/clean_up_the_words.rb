=begin
I:
a string that consists of some words (lowercase) and an assortment of
non-alphabetic characters
O:
that string with the non-alphabetic characters
replaced by spaces

R:
- if one or more non-alphabetic characters occur in a row, there should
be only one space at that location in the result
-there should never be consecutive spaces

D:
array

A:
split by chars
for char in array
  if NON_ALPHABET.include?(char)
    array.delete_at(index(char))


=end
ALPHABET = ('a'..'z').to_a

def cleanup(string)
  clean_string = []
  string.chars.each do |char|
    if ALPHABET.include?(char)
      clean_string << char
    else
      clean_string << ' ' unless clean_string.last == ' '
    end
    p clean_string
  end
  p clean_string.join
end

p cleanup("---what's my +*& line?")
