=begin
##1. Initialize deck
##2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.
=end

SUITS = %w(hearts diamonds clubs spades)
VALUES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)

def display_welcome
  system 'clear'
  puts <<-MSG

       ====== Welcome to 21! ======         

                      --
                  - Rules -
                      --
   The player and dealer are both dealt 2 random cards.
   Your goal is to get as close as you can to 21 points without going over,
   but higher than the dealer's total.

                      --
                  - Points -
                      --
              Cards 2-10 = equal to face value
       jack, queen, king = 10
                     ace = 1 or 11
                     

        puts "Press Enter to Continue"
  MSG
end

def num?(num_str)
  num_str.to_i.to_s == num_str
end

def point_value(card)
  if card == 'ace'
    [1, 11]
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
      card[:card] = value
      card[:points] = point_value(value)
      new_deck << card
    end
  end
  new_deck
end

# Bad to do one thing, but in two places?
def deal_cards!(deck)
  hand_of_cards = []
  2.times do
    # Add card to player hand
    card = deck.sample
    hand_of_cards << card
    # Remove the card from the deck
    deck.delete(card)
  end
  hand_of_cards
end

display_welcome
gets

# Initialize deck
deck = initialize_deck

# Deal cards to player and dealer
player_hand = deal_cards!(deck)
dealer_hand = deal_cards!(deck)

# puts "Player hand: #{player_hand}"
# puts "Dealer hand: #{dealer_hand}"

