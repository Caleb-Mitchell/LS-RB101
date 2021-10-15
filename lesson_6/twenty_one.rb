SUITS = %w(hearts diamonds clubs spades)
VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system 'clear'
end

# rubocop:disable Metrics/MethodLength
def display_welcome
  system 'clear'
  puts <<-MSG

         ====== Welcome to 21! ======         

                      --
                  - Rules -
                      --
   - The player and dealer are both dealt 2 random cards.
  
   - Your goal is to get as close as you can to 21 points without going over,
     but higher than the dealer's total.

                      --
                  - Points -
                      --
              Cards 2-10 = equal to face value
       jack, queen, king = 10
                     ace = 1 or 11
                     
                  ==========

        puts "Press Enter to Continue"
  MSG
  gets
end
# rubocop:enable Metrics/MethodLength

def num?(num_str)
  num_str.to_i.to_s == num_str
end

def point_value(card)
  if card == 'Ace'
    nil
  elsif num?(card)
    card.to_i
  else
    10
  end
end

def initialize_deck
  new_deck = []
  SUITS.each do |suit|
    VALUES.each do |value|
      card = {}
      card[:suit] = suit
      card[:value] = value
      card[:points] = point_value(value)
      new_deck << card
    end
  end
  new_deck
end

def initialize_score
  { player: 0, dealer: 0 }
end

def deal!(hand, deck, num_cards)
  num_cards.times do
    card = deck.sample
    hand << card

    deck.delete(card)
  end
end

def join_and(arr, delimiter=', ', word='and')
  if arr.size == 2
    arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def display_dealer_hand_with_secret(dealer_hand)
  puts "Dealer has: #{dealer_hand[0][:value]}, and an unknown card."
end

def display_current_hands(player_hand, dealer_hand, turn='player_turn')
  player_cards = []
  dealer_cards = []

  player_hand.each do |card|
    player_cards << card[:value]
  end
  dealer_hand.each do |card|
    dealer_cards << card[:value]
  end

  system 'clear'
  puts ""
  puts ""
  puts "You have: #{join_and(player_cards)}"
  if turn == 'player_turn'
    display_dealer_hand_with_secret(dealer_hand)
  else
    puts "Dealer has: #{join_and(dealer_cards)}"
  end
  puts ""
  puts ""
end

def display_current_points(score, turn='player_turn')
  puts "Player points: #{score[:player]}"

  if turn == 'player_turn'
    puts "Dealer points: ??"
  else
    puts "Dealer points: #{score[:dealer]}"
  end
  puts ""
  puts ""
end

def tally_num_aces(hand)
  num_aces = 0
  hand.each do |card|
    num_aces += 1 if card[:value] == 'Ace'
  end
  num_aces
end

def tally_hand_minus_aces(hand)
  hand_minus_aces = 0
  hand.each do |card|
    hand_minus_aces += card[:points] unless card[:value] == 'Ace'
  end
  hand_minus_aces
end

def totaled_score!(score, hand, player_or_dealer)
  running_total = tally_hand_minus_aces(hand)

  num_aces = tally_num_aces(hand)
  num_aces.times do
    running_total += (running_total + 11) > 21 ? 1 : 11
  end

  score[:player] = running_total if player_or_dealer == 'player'
  score[:dealer] = running_total if player_or_dealer == 'dealer'
end

def hit!(player_hand, dealer_hand, deck, player_or_dealer)
  if player_or_dealer == 'player'
    deal!(player_hand, deck, 1)
  elsif player_or_dealer == 'dealer'
    deal!(dealer_hand, deck, 1)
  end
end

def busted?(score, player_or_dealer)
  if player_or_dealer == 'player'
    score[:player] > 21
  elsif player_or_dealer == 'dealer'
    score[:dealer] > 21
  end
end

def nobody_busted?(score)
  score[:player] <= 21 && score[:dealer] <= 21
end

def calculate_no_bust_winner(score)
  if score[:player] == score[:dealer]
    'tie'
  elsif score[:player] > score[:dealer]
    'player'
  else
    'dealer'
  end
end

def calculate_game_winner(score)
  if nobody_busted?(score)
    calculate_no_bust_winner(score)
  elsif busted?(score, 'player') && !busted?(score, 'dealer')
    'dealer'
  elsif !busted?(score, 'player') && busted?(score, 'dealer')
    'player'
  else
    'tie'
  end
end

def display_game_winner(game_winner)
  case game_winner
  when 'player' then puts "You win!!"
  when 'dealer' then puts "Sorry, dealer wins this time."
  when 'tie'    then puts "Its a tie!"
  end
end

def play_again?
  answer = ''
  loop do
    puts ""
    prompt "Play again? (y)es or (n)o:"
    answer = gets.chomp
    if ['n', 'no'].include?(answer)
      return false
    elsif ['y', 'yes'].include?(answer)
      return true
    else
      prompt "Invalid input, please enter (y)es or (n)o"
      next
    end
  end
end

def ask_player_hit_or_stay
  puts "hit or stay?"
  gets.chomp
end

def dealer_can_stop?(score)
  score[:dealer] >= 17 && !busted?(score, 'dealer')
end

player_busted = ''
loop do
  display_welcome
  player_busted = false

  deck = initialize_deck
  score = initialize_score
  player_hand = []
  dealer_hand = []

  deal!(player_hand, deck, 2)
  deal!(dealer_hand, deck, 2)
  totaled_score!(score, player_hand, 'player')
  totaled_score!(score, dealer_hand, 'dealer')

  # Player turn
  loop do
    display_current_hands(player_hand, dealer_hand)
    display_current_points(score)

    answer = ask_player_hit_or_stay

    if answer == 'hit'
      hit!(player_hand, dealer_hand, deck, 'player')
      totaled_score!(score, player_hand, 'player')
    end

    break if answer == 'stay' || busted?(score, 'player')
  end

  if busted?(score, 'player')
    clear_screen
    puts "Player busted!, you lose!"
    display_current_points(score)
    player_busted = true
    break unless play_again?
  else
    puts "You chose to stay!"
  end

  # Dealer turn
  puts "dealer turn:"
  loop do
    break if player_busted

    display_current_hands(player_hand, dealer_hand, 'dealer_turn')
    display_current_points(score, 'dealer_turn')

    break if dealer_can_stop?(score) || busted?(score, 'dealer')

    hit!(player_hand, dealer_hand, deck, 'dealer')
    totaled_score!(score, dealer_hand, 'dealer')
  end

  if player_busted == false
    game_winner = calculate_game_winner(score)
    display_game_winner(game_winner)
    break unless play_again?
  end
end

puts "thanks for playing!"
