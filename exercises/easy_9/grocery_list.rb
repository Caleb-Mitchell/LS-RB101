# Problem:
# - write a method which take a grocery list (array) of fruits with quantities
# and converts it into an array of the correct number of each fruit
# Input:
# - a nested array
# Output:
# - a flat array, with only the fruits
# Algorithm:
# - make a new empty array fruits
# - for each array in argument array
#   - for the number of times in index 1
#     - shover name of fruit at index 0 to new array

def buy_fruit(array)
  fruits = []
  array.each do |sub_array|
    sub_array[1].times { fruits << sub_array[0] }
  end
  fruits
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

