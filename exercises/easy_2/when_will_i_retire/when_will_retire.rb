require 'date'

print "What is your age? "
age = gets.chomp.to_i

print "At what age would you like to retire? "
retire_age = gets.chomp.to_i

current_year = Date.today.year
years_until_retire = retire_age - age
retire_year = current_year + years_until_retire

puts "\nIt's #{current_year}. You will retire in #{retire_year}."
puts "You have only #{years_until_retire} years of work to go!"
