def oddities(array)
  array.select do |i|
    i if array.index(i) == 0 || array.index(i).even?
  end
end

def oddities_2(array)
  index = 0
  odd_element_array = []
  while index < array.size
    odd_element_array << array[index]
    index += 2
  end
  odd_element_array
end

def oddities_3(array)
  new_array = []
  array.each_index do |i|
    new_array << array[i] if i.even? || i == 0
  end
  new_array
end

p oddities([2, 3, 4, 5, 6])
p oddities([1, 2, 3, 4, 5, 6])
p oddities(['abc', 'def'])
p oddities([123])
p oddities([])

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
