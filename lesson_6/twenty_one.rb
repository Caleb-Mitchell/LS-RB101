require 'pry'
require 'pry-byebug'
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
VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)

def prompt(msg)
  puts "=> #{msg}"
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
    # Add card to player hand
    card = deck.sample
    hand << card
    # Remove the card from the deck
    deck.delete(card)
  end
end

def display_current_hands(player_hand, dealer_hand)
  system 'clear'
  puts "Dealer has: #{dealer_hand[0][:value]}, and an unknown card."
  puts "You have: #{player_hand[0][:value]} and #{player_hand[1][:value]}"
end

def total_initial_score!(score, player_hand, dealer_hand)
  score[:player] = player_hand[0][:points] + player_hand[1][:points]
  score[:dealer] = dealer_hand[0][:points] + dealer_hand[1][:points]
end

# def tally_aces(hand)
#   num_aces = 0
#   hand.each do |card|
#     if card[:value] == 'Ace'
#       num_aces += 1
#     end
#   end
#   num_aces
# end

def totaled_score!(score, hand, player_or_dealer)
  total_points = 0
  num_aces = 0

  hand.each do |card|
    if card[:value] == 'Ace'
      num_aces += 1
    else
      total_points += card[:points]
    end
  end
  num_aces.times do
    total_points += (total_points + 11) > 21 ? 1 : 11
  end

  score[:player] = total_points if player_or_dealer == 'player'
  score[:dealer] = total_points if player_or_dealer == 'dealer'
end

# def totaled_score!(score, player_hand, dealer_hand, player_or_dealer)
#   total_points = 0
#   num_aces = 0
#   if player_or_dealer == 'player'
#     player_hand.each do |card|
#       if card[:value] == 'Ace'
#         num_aces += 1
#       else
#         total_points += card[:points]
#       end
#     end
#     num_aces.times do
#       unless (total_points + 11) > 21
#         total_points += 11
#       else
#         total_points += 1
#       end
#     end
#     score[:player] = total_points
#   elsif player_or_dealer == 'dealer'
#     dealer_hand.each do |card|
#       if card[:value] == 'Ace'
#         num_aces += 1
#       else
#         total_points += card[:points]
#       end
#     end
#     num_aces.times do
#       unless (total_points + 11) > 21
#         total_points += 11
#       else
#         total_points += 1
#       end
#     end
#     score[:dealer] = total_points
#   end
# end

# hit! adds a card to the appropriate hand
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

def calculate_game_winner(score)
  if !busted?(score, 'player') && !busted?(score, 'dealer')
    if score[:player] == score[:dealer]
      'tie'
    elsif score[:player] > score[:dealer]
      'player'
    else
      'dealer'
    end
  elsif !busted?(score, 'player') && busted?(score, 'dealer')
    'player'
  elsif busted?(score, 'player') && !busted?(score, 'dealer')
    'dealer'
  else
    'tie'
  end
end

def display_game_winner(game_winner)
  case game_winner
  when 'player' then puts "you win!!"
  when 'dealer' then puts "dealer wins."
  when 'tie' then puts "its a tie!"
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

player_busted = ''
loop do
  display_welcome
  player_busted = false

  # Initialize deck, score, and hands
  deck = initialize_deck
  score = initialize_score
  player_hand = []
  dealer_hand = []

  # Deal 2 cards to player and dealer
  deal!(player_hand, deck, 2)
  deal!(dealer_hand, deck, 2)

  # Total initial score
  # Display current cards TODO get rid if this and subsequent display "current
  # score is:"
  # totaled_score!(score, player_hand, dealer_hand, 'player')
  totaled_score!(score, player_hand, 'player')
  # totaled_score!(score, player_hand, dealer_hand, 'dealer')
  totaled_score!(score, dealer_hand, 'dealer')

  puts "current score is #{score}"
  display_current_hands(player_hand, dealer_hand)

  # Player turn, hit or stay?
  # repeat until bust or stay
  puts "player turn:"
  loop do
    system 'clear'
    display_current_hands(player_hand, dealer_hand)
    puts "current score is #{score}"

    puts "hit or stay?"
    answer = gets.chomp

    # hit
    if answer == 'hit'
      hit!(player_hand, dealer_hand, deck, 'player')
      # totaled_score!(score, player_hand, dealer_hand, 'player')
      totaled_score!(score, player_hand, 'player')
    end
    p player_hand
    break if answer == 'stay' || busted?(score, 'player')
  end

  if busted?(score, 'player')
    puts "ya busted!, you lose!"
    puts "final score is #{score}"
    player_busted = true
    break unless play_again?
  else
    puts "You chose to stay!"
  end

  # break if player_busted
  # Dealer turn, will hit until score is 17 or higher, then stay
  puts "dealer turn:"
  loop do
    break if player_busted
    p score
    p dealer_hand

    if score[:dealer] >= 17 && !busted?(score, 'dealer')
      break
    elsif busted?(score, 'dealer')
      break
    end

    hit!(player_hand, dealer_hand, deck, 'dealer')
    # totaled_score!(score, player_hand, dealer_hand, 'dealer')
    totaled_score!(score, dealer_hand, 'dealer')
  end

  if player_busted == false
    game_winner = calculate_game_winner(score)
    display_game_winner(game_winner)
    break unless play_again?
  end
end

puts "thanks for playing!"
