=begin
# -------------------------------------- Problem ----------------------------------------
Explicit
  Return true if parentheses are balanced
    Balanced means count of "(" matches count of ")"
    Note that balanced pairs must each start with a (, not a ).

Implicit

Keyword

# -------------------------------------- Understand -------------------------
Model

Edge

Abstract
  Split string on non-parentheses
    If index 0 is ")" then it's false
    Elsif

# -------------------------------------- Slice ------------------------------

# -------------------------------------- Brainstorm ------------------------------

# -------------------------------------- Code -------------------------------------------
=end

# def balanced?(str)
#   arr = str.split(/[^(|)]/).delete_if(&:empty?)
#   arr = str.gsub!(/[^(|)]/, "").chars
#   arr = str.chars.select { |char| char.match?(/[(|)]/) }
#   return false if arr[0] == ")"
#   p arr
#   arr.count(")") == arr.count("(")
# end

def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  p parens
  parens.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is)))up(') == false
