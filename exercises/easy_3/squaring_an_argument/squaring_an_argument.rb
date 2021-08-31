# x to the yth power
def exponent(base, power)
  multiply(base, (base**(power - 1)))
end

def square(x)
  multiply(x, x)
end

def multiply(x, y)
  x * y
end

puts exponent(3, 3)
