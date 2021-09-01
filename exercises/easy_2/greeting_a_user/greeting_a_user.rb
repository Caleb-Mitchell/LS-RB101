print "What is your name? "
user_name = gets.chomp!

if !user_name.end_with?("!")
  puts "Hello #{user_name}."
else
  user_name.chop!
  puts "HELLO #{user_name.upcase}. WHY ARE WE SCREAMING?"
end
