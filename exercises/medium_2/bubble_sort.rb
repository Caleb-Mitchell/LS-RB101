# Problem:
# - Write a method that takes an Array as an argument, and sorts that Array
# using the bubble sort algorithm as just described
# Input:
# - an array
# Output:
# - that array sorted in place
# Rules:
# - array must be sorted in place / mutated
# - assume the array contains at least 2 elements
# Algorithm:
# - start loop
#   - set swapped = false
#   - iterate over array
#     - if current object > next object in array
#       - swap them
#       - swapped = true
#     - end if
#   - end iteration
#   break if swapped = false

# def bubble_sort!(array)
#   loop do
#     swapped = false
#     array.each_with_index do |ele, idx|
#       if ele > array[idx + 1]
#         temp = array[idx]
#         array[idx] = array[idx + 1]
#         array[idx + 1] = temp
#         swapped = true
#       end
#       break if idx == array.size - 2
#     end
#     break if swapped == false
#   end
#   nil
# end

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]

      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end

array = [5, 3]
bubble_sort!(array)
p array

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array
