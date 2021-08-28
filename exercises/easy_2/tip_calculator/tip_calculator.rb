def to_float(string)
  Float(string)
rescue ArgumentError
  nil
end

bill = ''
loop do
  print "What is the bill? "
  bill = gets
  break unless !to_float(bill) || bill.to_f <= 0
  puts "Please enter a valid dollar amount, greater than zero."
end

tip_percentage = ''
loop do
  print "What is the tip percentage? "
  tip_percentage = gets
  break unless !to_float(tip_percentage) || tip_percentage.to_f < 0
  puts "Please enter a valid percentage."
end

tip_value = (bill.to_f * (tip_percentage.to_f / 100))
total_bill = (bill.to_f + tip_value)

tip_value = format("%.2f", tip_value)
total_bill = format("%.2f", total_bill)

puts "The tip is $#{tip_value}"
puts "The total is $#{total_bill}"
