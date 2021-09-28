# Problem:
# - Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.
# Input:
# - two arrays
# Output:
# - one new array
# Rules:
# - new array must contain the product of every pair of numbers that can be
# formed between the elements of the two arrays
# - new array should be sorted by increasing value
# - may assume neither argument is an empty array
# * new array is NOT nested
# * numbers appear to be all ints
# Algorithm:
# - for each value in array1
#   - multiply by each value in array 2, and store product in new array
# - sort new array by increasing value
# - return new array
def multiply_all_pairs(array1, array2)
  array1.product(array2).map { |comb| comb.reduce(:*) }.sort
end

p multiply_all_pairs([1, 2, 3], [2, 4])

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
