=begin
P:
Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

Input:
1 array

Output:
2 arrays (as a pair of nested arrays)

Rules:
  explicit:
  the output must contain the first half, and second half, of the original array, respectively
  if the original array contains an odd numebrs of elements, the middle element should be placed in the first half array
  implicit:
  if empty array provided, return a nested array containing two empty arrays

Examples:
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

Data Structures:
arrays

Algorithm:
initialize new array1
initialize new array2

if size of array is even:
  call slice on array, from index 0-(array.size / 2), return first half to array1
  call slice on array, from index (array.size / 2) + 1 - end of array, return second half to array2
if size of array is odd:
  call slice on array, from index 0-(array.size / 2) + 1, return first half to array1
  call slice on array, from index (array.size / 2) + 2 - end of array, return second half to array 2

combine array1 and array2
return resulting array

OR

Duplicate the given array and bind it to a local variable
 reject.with_index

Condition expression:
  if array empty? || size == 1
=end

def halvsies(array)
  if array.size.even?
    array1 = array.reject.with_index { |n, i| n if i >= array.size / 2 }
    array2 = array.reject.with_index { |n, i| n if i < array.size / 2 }
    array3 = []
    array3.push(array1)
    array3.push(array2)
  elsif array.size.odd?
    array1 = array.reject.with_index { |n, i| n if i > array.size / 2 }
    array2 = array.reject.with_index { |n, i| n if i <= array.size / 2 }
    array3 = []
    array3.push(array1)
    array3.push(array2)
  end
end

p halvsies([1, 2, 3, 4, 5])

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
