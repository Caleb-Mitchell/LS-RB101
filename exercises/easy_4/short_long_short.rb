=begin
I:
2 strings as method arguments

O:
the result of contatenating the shorter string, the longer, and the
shorter again

R:
assume the strings are different lengths
*all lower-case?
*any empty strings?

PD:
string concatenation

MM:
with two strings, find the longest and then make a new string that
goes short-long-short

E:
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

T:
short_long_short('  ', 'x') == "x  x"
short_long_short('x ', ' ') == " x "

A:
-save both strings
-pick which is the longest
-print short long short

=end

def short_long_short(str1, str2)
  if str1.length > str2.length
    str2 + str1 + str2
  else
    str1 + str2 + str1
  end
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
