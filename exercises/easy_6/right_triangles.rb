# ====PEDAC====
# Problem:
# (restate certain elements)(problem domain)
# - write a method that takes a positive integer, n, as an argument, and
# displays a right triangle whose sides each have n stars. The hypotenuse of the
# triangle should have one end at the lower-left of the triangle, and the other
# end at the upper-right
# Input: a postive integer, n
# Output: a right triange whose sides each have n stars
# Rules:
#   Explicit:
#   -
#   (Questions?)
#   Implicit:
#   - 
# Mental Model:
# - 
# Examples:
# (test cases - 0, emptiness, boundary conditions, repitition/duplication,
# upper/lower case, data types, raise exceptions/report errors, special values)
# (edge cases - negative numbers, 0, extremely high values)
# - 
# Data Structure:
# - 
# Storm:
# - 
# Algorithm:
# - set a counter = 1
# - loop n times
#   - print a number of spaces n - counter
#   - print a number of stars counter
#   - increment counter by 1
# - end loop
# C(ode, with intent):
# (Create any necessary Test Cases)

def triangle(n)
  (1..n).each do |i|
  # (1..n).reverse_each do |i|
    print " " * (n - i)
    puts "*" * i
  end
end

triangle(9)
