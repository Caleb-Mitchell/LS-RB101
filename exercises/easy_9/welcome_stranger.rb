# Problem: - Create a method that takes 2 arguments, an array and a hash. The
# array will contain 2 or more elements that, when combined with adjoining
# spaces, will produce a person's name. The hash will contain two keys, :title
# and :occupation, and the appropriate values. Your method should return a
# greeting that uses the person's full name, and mentions the person's title and
# occupation.
# Input:
# - an array, and a hash
# Output:
# - a string, interpolating the details from the input
# Rules:
# * no empty fields
# Algorithm:
# - build string through interpolation

def greetings(array, hash)
  # name = ''
  # array.each_with_index do |name_ele, idx|
  #   if idx == array.index(array.last)
  #     name << name_ele
  #   else
  #     name << name_ele + ' '
  #   end
  # end
  name = array.join(' ')

  "Hello, #{name}! Nice to have a #{hash[:title]} #{hash[:occupation]} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
