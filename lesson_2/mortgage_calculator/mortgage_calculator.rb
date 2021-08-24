def prompt(text)
  puts "=> #{text}"
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_i.to_f == num
end

def number?(num)
  integer?(num) || float?(num)
end

prompt('Welcome to Mortgage Calculator.')
prompt('Let\'s start with a few questions.')

loan_amount = ''
loop do
  prompt('What is the size of the loan?:')

  loan_amount = gets.chomp
  break if number?(loan_amount)
  puts 'Please enter a valid loan amount:'
end

apr = ''
loop do
  prompt('What % is the interest rate?:')

  apr = gets.chomp
  break if number?(apr)
  puts 'Please enter a valid APR percentage.'
end

loan_duration = ''
loop do
  prompt('What is the duration of the loan, in months.')

  loan_duration = gets.chomp
  break if number?(loan_duration) && loan_duration.to_i > 0
  puts 'Please enter a valid number of months.'
end

monthly_interest_rate = (apr.to_f / 100) / 12

monthly_payment = loan_amount.to_f * (monthly_interest_rate / \
                  (1 - (1 + monthly_interest_rate)**\
                  (loan_duration.to_i * -1)))

monthly_payment = 0.00 if monthly_payment.nan?

payments_total = monthly_payment * loan_duration.to_i
total_interest = payments_total - loan_amount.to_f

puts "monthly payment = $#{monthly_payment.round(2)}"
puts "total of monthly payments = $#{payments_total.round(2)}"
puts "total interest = $#{total_interest.round(2)}"
