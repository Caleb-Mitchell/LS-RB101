INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
POINTS_TO_WIN = 5

def prompt(msg)
  puts "=> #{msg}"
end

def display_welcome
  system 'clear'
  welcome_message = <<-MSG
  ====Welcome to TicTacToe====
  Would you like to choose who goes first?
  (If not, the computer will choose randomly)
  Please enter (y)es or (n)o:
  MSG
  puts welcome_message
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd, score)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "--Current Score-- (First to #{POINTS_TO_WIN} wins!)"
  puts "Player: #{score[:player]}"
  puts "Computer: #{score[:computer]}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def initialize_score
  { player: 0, computer: 0 }
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimeter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimeter)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd), '; ', 'and')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = if board_threat?(brd, COMPUTER_MARKER)
             threat_location(brd, COMPUTER_MARKER)
           elsif board_threat?(brd, PLAYER_MARKER)
             threat_location(brd, PLAYER_MARKER)
           elsif brd[5] == INITIAL_MARKER
             5
           else
             empty_squares(brd).sample
           end
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def line_threat?(brd, line, marker)
  brd.values_at(*line).count(marker) == 2 &&
    brd.values_at(*line).count(" ") == 1
end

def board_threat?(brd, marker)
  WINNING_LINES.each do |line|
    return true if brd.values_at(*line).count(marker) == 2 &&
                   brd.values_at(*line).count(" ") == 1
  end
  false
end

def threat_location(brd, marker)
  WINNING_LINES.each do |line|
    if line_threat?(brd, line, marker)
      return brd.select { |k, v| line.include?(k) && v == ' ' }.keys.first
    end
  end
end

def place_piece!(brd, current_player)
  if current_player == 'Player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player = if current_player == 'Player'
                     'Computer'
                   else
                     'Player'
                   end
  current_player
end

def set_who_goes_first
  player_choice = gets.chomp.downcase
  if player_choice.start_with?('y')
    puts "Who should go first? (p)layer or (c)omputer?"
    first_turn_choice = gets.chomp.downcase
    current_player = if first_turn_choice.start_with?('p')
                       'Player'
                     else
                       'Computer'
                     end
  else
    current_player = ['Player', 'Computer'].sample
  end
  current_player
end

def display_game_winner(brd, score)
  system 'clear'
  display_board(brd, score)
  prompt "#{detect_winner(brd)} won!"
  prompt "Hit any key to continue."
  gets
end

def display_tie
  prompt "It's a tie!"
  prompt "Hit any key to continue."
  gets
end

def display_grand_winner(score)
  if score[:player] == POINTS_TO_WIN
    system 'clear'
    prompt "You are the grand winner!"
  elsif score[:computer] == POINTS_TO_WIN
    system 'clear'
    prompt "Sorry, the computer wins this time."
  end
end

def play_again?
  prompt "Play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('n') ? false : true
end

def increment_score!(score, brd)
  case detect_winner(brd)
  when 'Player' then score[:player] += 1
  when 'Computer' then score[:computer] += 1
  end
end

# Main loop, first to POINTS_TO_WIN wins
loop do
  score = initialize_score

  display_welcome
  current_player = set_who_goes_first

  # Inner game loop
  loop do
    board = initialize_board

    loop do
      display_board(board, score)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, score)

    if someone_won?(board)
      increment_score!(score, board)
      display_game_winner(board, score)
    else
      display_tie
    end

    break if score[:player] == POINTS_TO_WIN ||
             score[:computer] == POINTS_TO_WIN
  end

  display_grand_winner(score)

  break if !play_again?
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
