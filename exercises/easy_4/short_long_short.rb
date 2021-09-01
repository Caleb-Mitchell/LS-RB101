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


=end
