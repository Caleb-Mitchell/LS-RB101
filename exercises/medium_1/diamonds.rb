# Problem:
# - Write a method that displays a 4-pointed diamond in an n x n grid, where n
# is an odd integer that is supplied as an argument to the method. You may
# assume that the argument will always be an odd integer.
# Input:
# - an int, the height and width of an int x int diamond
# Output:
# - a 4-pointed diamond in an int x int grid
# Rules:
# - n is always an odd integer
# Algorithm:
# - draw top half of diamond
#   - draw one diamond
#   - draw 1 + 2 diamonds
#   - draw 1 + 4 diamonds
#   - break when multiple == n - 1
# - draw middle
#   - puts asterisk * n
# - draw bottom half

def draw_middle(grid_size)
  puts '*' * grid_size
end

def draw_top_half(grid_size)
  space_counter = 0
  star_counter = 1
  loop do
    break if space_counter == (grid_size / 2)

    print ' ' * ((grid_size / 2) - space_counter)
    puts '*' * star_counter

    space_counter += 1
    star_counter += 2
  end
end

def draw_bottom_half(grid_size)
  space_counter = (grid_size / 2) - 1
  star_counter = grid_size - 2
  loop do
    break if space_counter == -1

    print ' ' * ((grid_size / 2) - space_counter)
    puts '*' * star_counter

    space_counter -= 1
    star_counter -= 2
  end
end

def diamond(grid_size)
  draw_top_half(grid_size)
  draw_middle(grid_size)
  draw_bottom_half(grid_size)
end

diamond(1)
diamond(3)
diamond(9)
