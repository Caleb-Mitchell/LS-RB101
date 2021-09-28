# Need to alter this method so that it ignores non-alphabetic characters when
# determining whether it should uppercase or lowercase each letter. The
# non-alphabetic characters should still be included in the return value; they
# just don't count when toggling the desired case.
def staggered_case(string)
  characters = string.chars
  need_upcase = true

  characters.each do |char|
    if char.match?(/[a-zA-Z]/) && need_upcase
      char.upcase!
      need_upcase = false
    elsif char.match?(/[a-zA-Z]/) && !need_upcase
      char.downcase!
      need_upcase = true
    else
      next
    end
  end
  characters.join
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
