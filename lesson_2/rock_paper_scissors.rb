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
    spock_or_scissors()
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

def tally_score(score, player_win_bool)
  if player_win_bool
    score[0] += 1
  else
    score[1] += 1
  end
end

def display_score(score)
  current_score = <<-MSG
 The current score is:
    Player: #{score[0]}
    Computer: #{score[1]}
  MSG

  prompt(current_score)
end

def game_over?(score)
  return true if score[0] == 3 || score[1] == 3
end

def display_game_winner(score)
  if score[0] == 3
    prompt("You are the grand winner!")
  elsif score[1] == 3
    prompt("The computer is the grand winner!")
  end
end

score = [0, 0]
loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if choice.size() == 1 || choice.size() == 2
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

  tally_score(score, win?(choice, computer_choice))
  display_score(score)

  if game_over?(score)
    display_game_winner(score)

    prompt("Do you want to play again?")
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')

    score = [0, 0]
  end
end

prompt("Thank you for playing. Good bye!")
