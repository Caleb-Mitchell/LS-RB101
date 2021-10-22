=begin
# Problem:
- Write a method that takes a sentence string as input, and returns the same
string with any sequence of the words 'zero', 'one', 'two', 'three', 'four',
'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.
Input:
- a sentence string
Output:
- same string, with number strings converted to digit strings
Rules:
* ok to mutate original string object?
* preserve case? five Five (all number words are lowercase here)
* have to worry about special characters?
* Preserve everything other than number words
Algorithm:
- create a hash, mapping number words to number strings
- split the sentence string by space
- for each word in words
  - check word to see if it includes any key in hash?
  - if it does, gsub number value from hash for number word in array
  - return the array.join(' ')
=end

NUMBERS = {
  'zero' => '0',
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}

def word_to_digit(string)
  words = string.split
  # for each word in words array
  words.each do |word|
    # for each number key in NUMBERS
    NUMBERS.each_key do |number|
      word.gsub!(number, NUMBERS[number]) if word.include?(number)
    end
  end
  words.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
