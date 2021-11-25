=begin
Write a method that displays an 8-pointed star in an nxn grid, where n is an odd
integer that is supplied as an argument to the method. The smallest such star
you need to handle is a 7x7 grid.


input: an integer
output: an 8 pointed start in a grid

rules:
- n is always odd
- smallest star will be a 7x7 grid

mm:
- n times, print a line
- center line is n stars
- number of spaces in between stars in outer lines is:
  - 2 for n = 7
  - 3 for n = 9
  - 4 for n = 11
  


algo:
- find starting spaces
  - counter = 3
  - spaces = 0
  - subtract counter from n
  - divide result by 2, and add that to *spaces

- print top half
  - first line
    - concatenate a star, a center justified star of length spaces * 2 + 1
    - decrement spaces by 1
    - loop until spaces equals 0
  - next line
    - one space, a star, star in middle, a star before 1 space
  - goes until three centered stars

- print center line
  - print a star n times
- print bottom half

=end

def starting_spaces(n)
  counter = 3
  spaces = 0
  spaces += ((n - counter) / 2)
  spaces
end

def top_half(spaces)
  pad = 1
  until spaces == -1
    puts "*".rjust(pad) + "*".center((spaces * 2) + 1) + "*".ljust(pad)
    spaces -= 1
    pad += 1
  end
end

def middle_line(n)
  puts "*" * n
end

def bottom_half(spaces)
  spaces_start = 0 # right
  pad = spaces + 1
  until spaces_start == spaces + 1
    puts "*".rjust(pad) + "*".center((spaces_start * 2) + 1) + "*".ljust(pad)
    spaces_start += 1
    pad -= 1
  end
end

def star(n)
  spaces = starting_spaces(n)
  top_half(spaces)
  middle_line(n)
  bottom_half(spaces)
end

star(7)
star(9)
star(11)
