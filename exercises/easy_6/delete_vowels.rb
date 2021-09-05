=begin

Problem:

Write a method that takes an array of strings, and returns an array of the same
string values, except with the vowels (a, e, i, o, u) removed.

Examples:

remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

Input: Array of strings
Output: Array of the same string values without the vowels

Clarifying questions:
  - Same string object or copy ok?
  - and sometime 'y'?

Rules:
  Explicit reqs.:
    - Return an array of strings
  Implicit:
    - Preserve case
    - Preserve spaces
    - If string is all vowels, return empty string object
Data Structure: Array

Algorithm:
  - Initialize VOWELS = %w(a e i o u)
  - For each string in array
    - For each character in string
      - Delete if is VOWEL
  - Return array
=end
VOWELS = %w(a e i o u)

def remove_vowels(array)
  no_vowels = array.map do |word|
    word.chars.delete_if { |char| VOWELS.include?(char.downcase) }.join
  end
  no_vowels
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
