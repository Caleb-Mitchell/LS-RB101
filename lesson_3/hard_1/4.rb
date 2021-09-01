# def dot_separated_ip_address?(input_string)
#   dot_separated_words = input_string.split(".")
#   while dot_separated_words.size > 0 do
#     word = dot_separated_words.pop
#     break unless is_an_ip_number?(word)
#   end
#   return true
# end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  
  # if dot_separated_words.size > 4 ||
  #    dot_separated_words.size < 4
  #   puts "Invalid dot_separated_ip_address"
  #   return false
  # end

  # better implementation
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  # return true
  # can be shortened to just
  true
end


