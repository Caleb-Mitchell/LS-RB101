VALID_OPERATIONS = %w(s p)

def prompt(message)
  puts ">> #{message}"
end

def num?(number)
  number.to_i.to_s == number && number.to_i > 0
end

def compute_sum(num)
  (1..num).inject(:+)
end

def compute_product(num)
  (1..num).inject(:*)
end

def get_num
  int = ''
  loop do
    prompt("Please enter an integer greater than 0: ")
    int = gets.chomp
    break if num?(int)
    prompt("Sorry, invalid input!")
  end
  int = int.to_i
end

def get_operation
  user_choice = ''
  loop do
    prompt("Enter 's' to compute the sum, 'p' to compute the product.")
    user_choice = gets.chomp.downcase
    break if VALID_OPERATIONS.include?(user_choice)
    prompt("Sorry, please choose 's' or 'p'.")
  end
  user_choice
end

def go_again?
  repeat = ''
  loop do
    prompt("Perform another operation? (y/n)")
    repeat = gets.chomp.downcase
    break if repeat == 'y' || repeat == 'n'
    prompt("Please enter 'y' or 'n'")
  end
  repeat == 'y'
end

def compute(int, operation)
  if operation == 's'
    sum = compute_sum(int)
    prompt("The sum of the integers between 1 and #{int} is #{sum}.")
  elsif operation == 'p'
    product = compute_product(int)
    prompt("The product of the integers between 1 and #{int} is #{product}.")
  else
    prompt("Oops, unknown operation.")
  end
end

loop do
  int = get_num
  operation = get_operation

  compute(int, operation)

  break unless go_again? == true
end

prompt("Thank you!")
