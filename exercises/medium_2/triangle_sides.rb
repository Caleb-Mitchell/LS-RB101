=begin
Problem:
- A triangle is classified as follows:
    - equilateral All 3 sides are of equal length
    - isosceles 2 sides are of equal length, while the 3rd is different
    - scalene All 3 sides are of different length
- To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.
- Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

Input:
- three numbers, could be floats or integers
Output:
- a symbol, equil, isosc, scal, or invalid
Rules:
- conditions must be met for triangle to be valid at all

Algorithm:
- check if invalid, return :invalid
=end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort
  if ((sides[0] <= 0) || (sides[1] <= 0) || (sides[2] <= 0)) || ((sides[0] + sides[1]) <= sides[2])
    :invalid
  elsif (sides[0] == sides[1]) && (sides[1] == sides[2]) && (sides[0] == sides[2])
    :equilateral
  elsif (sides[0] == sides[1]) || (sides[1] == sides[2]) || (sides[0] == sides[2])
    :isosceles
  elsif (sides[0] != sides[1]) && (sides[1] != sides[2]) && (sides[0] != sides[2])
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
