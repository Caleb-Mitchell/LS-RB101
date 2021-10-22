# Problem:
# - Write a method that takes the 3 angles of a triangle as arguments, and
# returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the
# triangle is a right, acute, obtuse, or invalid triangle.
# Input:
# - three integers
# Output:
# - a symbol - :acute, :right, :obtuse, or :invalid
# Rules:
# - a valid triangle has a sum of angles equal to 180 degrees, and all angles
# greater than 0
# - may assume integer valued angles
# - may assume arguments are specified in degrees
# - right triangle: one angle is a right angle (90 degrees)
# - acute triangle: all 3 angles are less than 90 degrees
# - obtuse triangle: one angle is greater than 90 degrees
# Algorithm:
# - test if triangle is invalid
# - test for other three types in case statement

# def triangle(ang1, ang2, ang3)
#   angles = [ang1, ang2, ang3]
#   return :invalid if (angles.sum != 180) || angles.any? { |ang| ang <= 0 }

#   if angles.count { |angle| angle == 90 } == 1
#     :right
#   elsif angles.all? { |angle| angle < 90 }
#     :acute
#   elsif angles.count { |angle| angle > 90 } == 1
#     :obtuse
#   end
# end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  case
  when angles.reduce(:+) != 180, angles.include?(0)
    :invalid
  when angles.include?(90)
    :right
  when angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end

puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid
