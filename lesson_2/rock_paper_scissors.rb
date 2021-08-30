WINNING_MOVES = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'spock' => ['rock', 'scissors'],
  'lizard' => ['paper', 'spock']
}
VALID_CHOICES = WINNING_MOVES.keys

def prompt(message)
  Kernel.puts("=> #{message}")
end

def clear_screen
  puts "\e[H\e[2J"
end

def display_welcome
  welcome_message = <<-MSG
Welcome to Rock-Paper-Scissors-Lizard-Spock!
   ---------------------
   The rules are simple...
   Choose your "hand signal", and see if you beat the computer's choice!
   ---------------------
   Scissors cuts Paper covers Rock crushes
   Lizard poisons Spock smashes Scissors
   decapitates Lizard eats Paper disproves
   Spock vaporizes Rock crushes Scissors
   ---------------------
  MSG

  prompt(welcome_message)
end

def start_game
  clear_screen
  display_welcome
end

def player_choice
  loop do
    prompt("Choose one: (r)ock, (p)aper, (sc)issors, (l)izard, (sp)ock")
    choice = Kernel.gets().chomp().downcase()

    if choice.size() == 1 || choice.size() == 2
      return choice = interpret_abbrev(choice)
    end

    if VALID_CHOICES.include?(choice)
      return choice
    else
      prompt("That's not a valid choice.")
    end
  end
end

def interpret_abbrev(choice)
  case choice
  when 'r' then 'rock'
  when 'p' then 'paper'
  when 'l' then 'lizard'
  when 'sc' then 'scissors'
  when 'sp' then 'spock'
  when 's' then spock_or_scissors()
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
    prompt("==You win the round!==")
  elsif win?(computer, player)
    prompt("==Computer wins the round!==")
  else
    prompt("It's a tie!")
  end
end

def tally_score(score, choice, computer_choice)
  if win?(choice, computer_choice)
    score[0] += 1
  elsif win?(computer_choice, choice)
    score[1] += 1
  end
end

def display_score(score)
  current_score = <<-MSG
 ---------------------
    The current score is:
    Player: #{score[0]}
    Computer: #{score[1]}
    ---------------------
  MSG

  prompt(current_score)
end

def game_over?(score)
  return true if score[0] == 3 || score[1] == 3
end

def display_game_winner(score)
  if score[0] == 3
    prompt("==You are the grand winner!==")
  elsif score[1] == 3
    prompt("==The computer is the grand winner!==")
  end
end

def play_again?
  answer = ''
  loop do
    prompt("Do you want to play again? (y/n)")
    answer = Kernel.gets().chomp().downcase()
    break if answer == 'y' || answer == 'n'
    puts "Please enter 'y' or 'n'"
  end

  return true if answer == 'y'
  return false if answer == 'n'
end

def reset_game(score)
  score[0] = 0
  score[1] = 0
  clear_screen
end

# Main game loop
start_game
score = [0, 0]
loop do
  choice = player_choice
  computer_choice = VALID_CHOICES.sample()

  clear_screen

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_result(choice, computer_choice)

  tally_score(score, choice, computer_choice)

  display_score(score)

  if game_over?(score)
    display_game_winner(score)

    break unless play_again?

    reset_game(score)
  end
end

prompt("Thank you for playing. Good bye!")
