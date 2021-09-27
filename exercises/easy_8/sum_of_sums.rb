# Problem:
# - write a method that takes an array of numbers and then returns the sum of
# the sums of each leading subsequence for that array.
# Input:
# - an array of numbers
# Output:
# - an integer, the sum of each leading subsequence of the array
# Rules:
# - may assume that the Array always contains at least one number
# * safe to assume all objects are integers? no floats?
# * what is a subsequence?
#   - looks like in examples
# * any duplicates?
# Mental Model:
# - add the first number, plus the first and second number, plus the first and
# second and third number, etc..
# Algorithm:
# - set variable total_sum = 0
# - for number in array
#   - create temp_arr = []
#   - for numbers from index 0 to current number
#     - push numbers to temp_arr
#     - add sum of numbers in temp_arr to total_sum
# - return total
def sum_of_sums(array)
  total_sum = 0

  array.each_with_index do |_, idx|
    temp_arr = []
    0.upto(idx) do |sub_arr_num|
      temp_arr.push(array[sub_arr_num])
    end
    total_sum += temp_arr.sum
  end
  total_sum
end

puts sum_of_sums([3, 5, 2]) # == (3) + (3 + 5) + (3 + 5 + 2)
puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35
