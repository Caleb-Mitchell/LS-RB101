VALID_CHOICES = %w(rock paper scissors lizard spock)
WINNING_MOVES = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'spock' => ['rock', 'scissors'],
  'lizard' => ['paper', 'spock']
}

def clear_screen
  puts "\e[H\e[2J"
end

def reset_game(score)
  score[0] = 0
  score[1] = 0
  clear_screen
end

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
    prompt("==You win the round!==")
  elsif win?(computer, player)
    prompt("==Computer wins the round!==")
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

score = [0, 0]

clear_screen

display_welcome
loop do
  choice = ''
  loop do
    # prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("Choose one: (r)ock, (p)aper, (sc)issors, (l)izard, (sp)ock")
    choice = Kernel.gets().chomp().downcase()

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

  clear_screen

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_result(choice, computer_choice)

  tally_score(score, win?(choice, computer_choice))
  display_score(score)

  if game_over?(score)
    display_game_winner(score)

    prompt("Do you want to play again?")
    answer = Kernel.gets().chomp().downcase()
    break unless answer.downcase().start_with?('y')

    reset_game(score)
  end
end

prompt("Thank you for playing. Good bye!")

=begin
TODO
- display game rules and a quick welcome before game begins***
- clear the screen before the game starts for a "clean slate"***
- clear the screen between rounds***
- make user input case insensitive***
- elimiate small repition in constants, call WINNING_MOVES.keys
  for VALID_CHOICES
- add an additional branch to conditional in tally_score to avoid computer being
  awarded a point on a tie
- extract 104-117 into a 'player choice' method
- extra 132-143 to a 'play_again?' method (can break out of the loop with
  something like 'break unless play_again?')
  - make it so only 'n' or 'N' exits game at end
=end
