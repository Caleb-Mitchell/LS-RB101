require 'pry'
require 'pry-byebug'
SUITS = %w(hearts diamonds clubs spades)
VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)

def prompt(msg)
  puts "=> #{msg}"
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

# rubocop:disable Metrics/MethodLength
def display_welcome
  clear_screen
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

  MSG
end
# rubocop:enable Metrics/MethodLength

def card_list(hand)
  card_list = []

  hand.each do |card|
    card_list << "#{card[:value]} of #{card[:suit]}"
  end
  card_list
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
    running_total += (running_total + 11) > 21 ? 1 : 11
  end

  running_total
end

def display_game(hands, score)
  clear_screen
  puts <<-GAME

         ============================





  Player has: #{card_list(hands[:player]).join(', ')}

  Dealer has: #{card_list(hands[:dealer]).join(', ')}


  Player Points: #{score[:player]}
  Dealer Points: #{score[:dealer]}





                  ==========

  GAME
end

def ask_hit_or_stay
  player_choice = ''
  loop do
    puts "Would you like to (h)it or (s)tay?"
    player_choice = gets.chomp
    break if ['h', 'hit', 's', 'stay'].include?(player_choice)
    puts "Sorry, not a valid choice, please try again."
  end
  player_choice
end

def hit!(hand, deck)
  deal!(hand, deck, 1)
end

def bust?(score)
  score > 21
end

def update_score!(score, hands)
  score[:player] = totaled_score(hands[:player])
  score[:dealer] = totaled_score(hands[:dealer])
end

def display_outcome(score)
  if bust?(score[:player])
    puts "You busted, dealer wins."
  elsif bust?(score[:dealer])
    puts "Dealer busted, you win!"
  elsif score[:player] > score[:dealer]
    puts "You win!"
  elsif score[:dealer] > score[:player]
    puts "Sorry, dealer wins."
  end
end

# Initialize deck
display_welcome
deck = initialize_deck
hands = initialize_hands
score = initialize_score

# Deal cards to player and dealer
deal!(hands[:player], deck, 2)
deal!(hands[:dealer], deck, 2)

# Total scores of cards first dealt
update_score!(score, hands)

# Player turn
#   - repeat until bust or "stay"
loop do
  # Display game with hidden dealer values # TODO
  display_game(hands, score)

  player_choice = ask_hit_or_stay
  if player_choice.start_with?('h')
    hit!(hands[:player], deck)
    update_score!(score, hands)
  end

  break if player_choice.start_with?('s') || bust?(score[:player])
end

if bust?(score[:player])
  player_busted = true
  update_score!(score, hands)

  display_game(hands, score)
  display_outcome(score)
end

# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# loop do
#   break if player_busted
# end

# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.
