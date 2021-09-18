=begin

# ---------------------------------------- Problem ----------------------------------------
Explicit:
Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once), how would you determine which value occurs twice? Write a method that will find and return the duplicate value that is known to be in the array.

Implicit:


# ---------------------------------------- Examples ---------------------------------------


# ----------------------------------------- Data ------------------------------------------
Input: Array
Output: Integer

# ----------------------------------------- Algorithm -------------------------------------
Define method find_dup with 1 parameter
Sort the given array of integer elements

Select from the sorted array
  Within the block argument:
    Return an new array with the element if it's the same as value of its index + 1

Return the selected array value at index 0

# ----------------------------------------- Storm -----------------------------------------
Brute force?
  Iterate over collection
  For each value, save to variable
  Check each subsequent variable to see if it's the same
    If so, return that value
    Nested iteration?

Sort?
  If n == arr[i + 1] 

=end

def find_dup(array)
  sorted_array = array.sort

  sorted_array.select!.with_index { |integer, index| integer == sorted_array[index + 1] }

  sorted_array[0]
end

def find_dup(array)
  array.each_with_index do |outer_value, outer_index|
    array.each_with_index do |inner_value, inner_index|
      if inner_index > outer_index && inner_value == outer_value
        return inner_value
      end
    end
  end
end

def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end

p find_dup([1, 5, 3, 1]) == 1
p find_dup([18, 9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
