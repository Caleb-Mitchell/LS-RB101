=begin

Problem:
Write a method that takes two Arrays as arguments, and returns an Array that
contains all of the values from the argument Arrays. There should be no
duplication of values in the returned Array, even if there are duplicates in the
original Arrays.

I:
two arrays
O:
one array, containing all of the values of the two argument arrays

CQs:
Should any arrays, as values, persist into output?
Does order matter?

R:
no duplication of values in the returned array, even if there are duplicates
in the original array

DS:
arrays

A:
FOR each value in 2nd array
  if not present in 1st array, push to 1st array
RETURN THAT ARRAY
END

C:
=end

def merge(array1, array2)
  # array2.each { |value| array1.push(value) unless array1.include?(value) }
  # array1
  # array1.union(array2)
  array1 | array2
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
