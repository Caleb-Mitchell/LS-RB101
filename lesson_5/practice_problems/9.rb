# Problem:
# - given this data structure, return a new aray of the same structure but with
# the sub arrays being ordered (alphabetically or numerically as appropriate) in
# descending order
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

p(arr.map do |sub_arr|
    sub_arr.sort { |value1, value2| value2 <=> value1 }
  end)
