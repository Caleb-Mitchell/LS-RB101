OPERATORS = %w(+ - * / % **)

def prompt(message)
  puts "==> #{message}"
end

def get_nums
  array = []
  prompt("Enter the first number:")
  array << gets.chomp.to_f
  prompt("Enter the second number:")
  array << gets.chomp.to_f
end

array = get_nums

OPERATORS.each do |x|
  begin
    result = array[0].public_send(x.to_sym, array[1])
    prompt("#{array[0]} #{x} #{array[1]} = #{result}")
  rescue ZeroDivisionError
    puts "Can't divide by zero."
  end
end
