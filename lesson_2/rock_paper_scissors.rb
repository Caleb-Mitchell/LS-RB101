VALID_CHOICES = %w(rock paper scissors lizard spock)
WINNING_MOVES = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'spock' => ['rock', 'scissors'],
  'lizard' => ['paper', 'spock']
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def interpret_abbrev(choice)
  case choice
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 'l'
    'lizard'
  when 'sc'
    'scissors'
  when 'sp'
    'spock'
  when 's'
    spock_or_scissors
  end
end

def spock_or_scissors
  loop do
    prompt('Please input "sc" for scissors, or "sp" for spock')
    new_abbr = gets().chomp()
    if new_abbr == "sc"
      return "scissors"
    elsif new_abbr == "sp"
      return "spock"
    else
      next
    end
  end
end

def win?(first, second)
  WINNING_MOVES[first].include?(second)
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def tally_score(player_win_bool)
end

game_number = 0
score = [0, 0]

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if choice.size == 1 || choice.size == 2
      choice = interpret_abbrev(choice)
    end

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_result(choice, computer_choice)

  # prompt("Do you want to play again?")
  # answer = Kernel.gets().chomp()
  # break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
