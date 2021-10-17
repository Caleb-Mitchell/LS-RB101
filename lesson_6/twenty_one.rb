require 'pry'
require 'pry-byebug'
SUITS = %w(hearts diamonds clubs spades)
VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
WINNING_VALUE = 21
DEALER_STAY_VALUE = 17
POINTS_TO_WIN = 5

def prompt(msg)
  puts "=> #{msg}"
end

def prompt_player_to_continue
  prompt "Press Enter to continue."
end

def clear_screen
  system 'clear'
end

def initialize_deck
  new_deck = []
  SUITS.each do |suit|
    VALUES.each do |value|
      card = {}
      card[:suit] = suit
      card[:value] = value
      new_deck << card
    end
  end
  new_deck
end

def initialize_score
  { player: 0, dealer: 0 }
end

def initialize_hands
  { player: [], dealer: [] }
end

def deal!(hand, deck, num_cards)
  num_cards.times do
    card = deck.sample
    hand << card

    deck.delete(card)
  end
end

def deal_starting_hands(hands, deck)
  deal!(hands[:player], deck, 2)
  deal!(hands[:dealer], deck, 2)
end

# rubocop:disable Metrics/MethodLength
def display_welcome
  clear_screen
  puts <<-MSG

         ====== Welcome to 21! ======         

                  - Rules -

   - The player and dealer are both dealt 2 random cards.
  
   - Your goal is to get as close as you can to 21 points,
     without going over but higher than the dealer's total.

                  - Points -

              Cards 2-10 = equal to face value
       jack, queen, king = 10
                     ace = 1 or 11

                      --

           - Playing to best of #{POINTS_TO_WIN}! - 

                  ==========

  MSG
  prompt_player_to_continue
  gets
end
# rubocop:enable Metrics/MethodLength

def card_list(hand)
  card_list = []

  hand.each do |card|
    card_list << "#{card[:value]} of #{card[:suit]}"
  end
  card_list
end

def card_list_with_secret(hand)
  card_list = []

  card_list << "#{hand[0][:value]} of #{hand[0][:suit]}"
  card_list << "?? of ??"
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
    if ('2'..'10').to_a.include?(card[:value])
      hand_minus_aces += card[:value].to_i
    elsif %w(Jack Queen King).include?(card[:value])
      hand_minus_aces += 10
    end
  end
  hand_minus_aces
end

def totaled_score(hand)
  running_total = tally_hand_minus_aces(hand)

  num_aces = tally_num_aces(hand)
  num_aces.times do
    running_total += (running_total + 11) > WINNING_VALUE ? 1 : 11
  end

  running_total
end

def display_game(hands, score, grand_score)
  clear_screen
  puts <<-GAME
                 Grand Score
              Player: #{grand_score[:player]} Dealer: #{grand_score[:dealer]}
         ============================

    Player hand: #{card_list(hands[:player]).join(', ')}

    Dealer hand: #{card_list(hands[:dealer]).join(', ')}

                     ----

               Player Points: #{score[:player]}
               Dealer Points: #{score[:dealer]}

                  ==========




  GAME
end

def display_game_with_secrets(hands, score, grand_score)
  clear_screen
  puts <<-GAME
                 Grand Score
              Player: #{grand_score[:player]} Dealer: #{grand_score[:dealer]}
         ============================

    Player hand: #{card_list(hands[:player]).join(', ')}

    Dealer hand: #{card_list_with_secret(hands[:dealer]).join(', ')}

                     ----

               Player Points: #{score[:player]}
               Dealer Points: ??

                  ==========




  GAME
end

def ask_hit_or_stay
  player_choice = ''
  loop do
    prompt "Would you like to (h)it or (s)tay?"
    player_choice = gets.chomp
    break if ['h', 'hit', 's', 'stay'].include?(player_choice)
    prompt "Sorry, not a valid choice, please try again.\n\n"
  end
  player_choice
end

def hit!(hand, deck)
  deal!(hand, deck, 1)
end

def busted?(score)
  score > WINNING_VALUE
end

def update_score!(score, hands)
  score[:player] = totaled_score(hands[:player])
  score[:dealer] = totaled_score(hands[:dealer])
end

def detect_outcome(score)
  if busted?(score[:player])
    'player_bust_dealer_win'
  elsif busted?(score[:dealer])
    'dealer_bust_player_win'
  elsif score[:dealer] == score[:player]
    'tie'
  elsif score[:player] > score[:dealer]
    'no_bust_player_win'
  elsif score[:dealer] > score[:player]
    'no_bust_dealer_win'
  end
end

def display_outcome(score)
  case detect_outcome(score)
  when 'player_bust_dealer_win'
    prompt "You busted, dealer wins this round.\n\n"
  when 'dealer_bust_player_win'
    prompt "Dealer busted, you win this round!\n\n"
  when 'tie'
    prompt "It's a tie!\n\n"
  when 'no_bust_player_win'
    prompt "You win this round!\n\n"
  when 'no_bust_dealer_win'
    prompt "Sorry, dealer wins this round.\n\n"
  end
  prompt "Press Enter to continue."
  gets
end

def dealer_can_stop?(score)
  score[:dealer] >= DEALER_STAY_VALUE && !busted?(score[:dealer])
end

def display_dealer_hits
  prompt "Dealer hits!\n\n"
  prompt_player_to_continue
  gets
end

def display_player_stay
  prompt "You chose to stay.\n\n"
  prompt_player_to_continue
  gets
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
      prompt "Invalid input, please enter (y)es or (n)o:"
      next
    end
  end
end

def initialize_grand_score
  { player: 0, dealer: 0 }
end

def increment_grand_score!(score, grand_score)
  case detect_outcome(score)
  when 'player_bust_dealer_win' then grand_score[:dealer] += 1
  when 'no_bust_dealer_win'     then grand_score[:dealer] += 1
  when 'dealer_bust_player_win' then grand_score[:player] += 1
  when 'no_bust_player_win'     then grand_score[:player] += 1
  end
end

def grand_winner?(grand_score)
  grand_score[:player] == POINTS_TO_WIN || grand_score[:dealer] == POINTS_TO_WIN
end

def display_grand_winner(grand_score)
  if grand_score[:player] == POINTS_TO_WIN
    clear_screen
    prompt "You are the grand winner!!!"
  elsif grand_score[:dealer] == POINTS_TO_WIN
    clear_screen
    prompt "Sorry, the dealer wins the game this time.\n\n"
  end
end

# Outer loop, first to POINTS_TO_WIN wins
loop do
  display_welcome
  grand_score = initialize_grand_score

  loop do
    deck = initialize_deck
    hands = initialize_hands
    score = initialize_score

    # Deal cards to player and dealer
    deal_starting_hands(hands, deck)

    # Total scores of cards first dealt
    update_score!(score, hands)

    # Player turn
    loop do
      display_game_with_secrets(hands, score, grand_score)

      player_choice = ask_hit_or_stay
      if player_choice.start_with?('h')
        hit!(hands[:player], deck)
        update_score!(score, hands)
      end

      break if player_choice.start_with?('s') || busted?(score[:player])
    end

    if busted?(score[:player])
      # Save player_busted to true, used to skip dealer turn
      player_busted = true
      display_game(hands, score, grand_score)
    else
      display_player_stay
    end

    # Dealer turn
    loop do
      break if dealer_can_stop?(score) ||
               busted?(score[:dealer]) ||
               player_busted

      hit!(hands[:dealer], deck)
      update_score!(score, hands)

      display_game(hands, score, grand_score)
      display_dealer_hits
    end

    display_game(hands, score, grand_score)

    display_outcome(score)
    increment_grand_score!(score, grand_score)

    break if grand_winner?(grand_score)
  end

  display_grand_winner(grand_score)
  break unless play_again?
end

prompt "Thanks for playing!"
