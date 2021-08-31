print "Please write word or multiple words: "
string = gets.chomp

# array = string.split(//)

# count = 0
# array.each { |char| count += 1 if char != ' ' }
# Can just use String#size instead of defining myself
num = string.delete(' ').size

puts "There are #{num} characters in \"#{string}\"."
