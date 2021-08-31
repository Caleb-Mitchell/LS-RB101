COUNTS = %w(1st 2nd 3rd 4th 5th)

def prompt(message)
  puts "==> #{message}"
end

def populate_array
  array = []
  COUNTS.each do |i|
    prompt("Enter the #{i} number:")
    array << gets.chomp.to_i
  end
  array
end

def get_search_num
  prompt("Enter the last number:")
  gets.chomp.to_i
end

# def array_include_num?(array, search_num)
#   array.each do |i|
#     if i == search_num
#       return true
#     end
#   end
#   false
# end

array = populate_array
search_num = get_search_num

# if array_include_num?(array, search_num)
# can just use Ruby's Array#include? method instead of defining it myself
if array.include?(search_num)
  puts "The number #{search_num} appears in #{array}."
else
  puts "The number #{search_num} does not appear in #{array}."
end
