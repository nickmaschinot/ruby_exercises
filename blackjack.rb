require_relative "cards"
require_relative "game_modules"
class Game < Deck
  include Blackjack
  def initialize
    super
  end
end

deck = Game.new

p "Let's play some Blackjack"
#p "How much do you want to play with?"
#bnkroll = gets.chomp.to_i
while true
  p "place your bet or type QUIT"
  bet = gets.chomp
  if bet == "quit"
    puts "Goodbye"
    break
  end
  deck = Game.new
  deck.shuffle_deck
  player1 = deck.hand_new(2)
  player2 = deck.hand_new(2)
  deck.display(player1, "your")
  p ""
  deck.display_dealer(player2)
  while true
    if deck.blackjack?(player1); break; end
    p "Do you want to hit or stand?"
    input = gets.chomp.downcase
    if input == "hit"
      player1 += deck.hand_new(1)
      if deck.bust?(player1); break; end
    elsif input == "stand"
      break
    else
      p "Please respond with 'hit' or 'stay'"
    end
    deck.display(player1, "your")
  end
  deck.display(player1, "your")
  p "-------------"
  unless deck.blackjack?(player1) || deck.bust?(player1)
    while true
      if deck.hand_score(player2) <= 16
        p "Dealer hits"
        player2 += deck.hand_new(1)
        if deck.bust?(player2); break; end
      else
        p "Dealer stands"
        break
      end
    end
    p "-------------"
    p player2
    p deck.compare_hands(player1, player2)
  end
  p "play again? or QUIT?"
end
