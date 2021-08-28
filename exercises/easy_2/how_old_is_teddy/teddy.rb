random_age = rand(20..200)
puts "Please give me a name!"
user_name = gets.chomp
user_name = "Teddy" if user_name == ''

puts "#{user_name} is #{random_age} years old!"
