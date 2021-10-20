# Problem:
# - You have a bank of switches before you, numbered from 1 to n. Each switch is
# connected to exactly one light that is initially off. You walk down the row of
# switches and toggle every one of them. You go back to the beginning, and on
# this second pass, you toggle switches 2, 4, 6, and so on. On the third pass,
# you go back again to the beginning and toggle switches 3, 6, 9, and so on. You
# repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and
# returns an Array that identifies which lights are on after n repetitions.
# Input:
# - an integer, the total number of switches as well as the number of
# repetitions
# Output:
# - an array, signifying which lights are on after n repititions
# Rules:
# - the only numbers in the return array are the lights which are on
# MM:
# - after every repition, the array will contain numbers representing lights
# which are on at that time
# Algorithm:
#
# def toggle_light(symbol)
#  symbol == 1 ? 0 : 1
# end
#
# make an empty array lights
#
# first pass, toggle every 1 light
#   toggle all indices (index + 1 % 1 == 0)
#   [1, 1, 1, 1, 1]
# second pass, toggle every 2nd light
#   toggle indices 1, 3 (index + 1 % 2 == 0)
#   [1, 0, 1, 0, 1]
# third pass, toggle every 3rd light
#   toggle indices 2 (index + 1 % 3 == 0)
#   [1, 0, 0, 0, 1]
# fourth pass, toggle every 4th light
#   [1, 0, 0, 1, 1]
#   toggles indices 3
# fifth pass, toggle every 5th light
#   [1, 0, 0, 1, 0]
#   toggle indices 4
#
# last step, map lights 'on' to index + 1

def toggle_one_light(light)
  light == 1 ? 0 : 1
end

def toggle_every_nth_light(lights, n)
  1.upto(n) do |multiple|
    lights.each_with_index do |light, idx|
      lights[idx] = toggle_one_light(light) if ((idx + 1) % multiple).zero?
    end
  end
  lights
end

def convert_to_indices(toggled_lights)
  toggled_lights.map.with_index do |light, idx|
    light == 1 ? (idx + 1) : 0
  end
end

def toggle_lights(n)
  lights = []
  n.times { lights << 0 }

  toggled_lights = toggle_every_nth_light(lights, n)
  indices = convert_to_indices(toggled_lights)

  indices.delete_if(&:zero?)
end

puts toggle_lights(5) == [1, 4]
puts toggle_lights(10) == [1, 4, 9]
p toggle_lights(1000)
