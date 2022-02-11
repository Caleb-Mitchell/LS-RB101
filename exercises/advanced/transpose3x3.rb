# https://launchschool.com/exercises/01d32e03

=begin
input: a nested array, a matrix
output: a nested array, with elements transposed

mm:
we need to swap the collumn index, and the row index, for each element, of each subarry

algo:
set counter for row number to 0
set counter for collumn number to 0

outer iteration: column
  inner iteration: 

create a new matrix_array
from 0 to the 3, exclusively, column_idx
  create a new array
  for each row in the original matrix:
    push to the new array the element at index `column_idx`
  push the new sub array to the new matrix  
=end

def transpose(matrix)
  new_matrix = []
  (0...3).each do |column_idx|
    new_array = []
    matrix.each do |row|
      new_array << row[column_idx]
    end
    new_matrix << new_array
  end
  new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
