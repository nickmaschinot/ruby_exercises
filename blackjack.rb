require_relative "cards"
require_relative "game_modules"
class Game < Deck
  include Blackjack
  def initialize
    super
  end
end

class Player < Game
  attr_reader :name
  attr_accessor :money
  def initialize(name, money)
    @name = name
    @money = money
  end
end


p "Let's play some Blackjack"
p "What's your name?"
name = gets.chomp
p "How much do you want to play with?"
bnkroll = gets.chomp.to_i
plyr = Player.new(name, bnkroll)
p "Alright #{name}, let's play"
while true
  p "place your bet or type QUIT"
  while true
    bet = gets.chomp.downcase
    if bet == "quit"
      puts "Goodbye"
      return
    elsif bet.count("a-z") > 0
      puts "Please only input integers or quit"
    else
      bet = bet.to_i
      if bnkroll - bet < 0
        p "You dont have enough money to place that bet"
        p "You have #{bnkroll} remaining"
        p "Place a smaller bet:"
      else
        break
      end
    end
  end
  deck = Game.new
  deck.shuffle_deck
  player1 = deck.hand_new(2)
  player2 = deck.hand_new(2)
  deck.display(player1, "your")
  p ""
  deck.display_dealer(player2)
  while true
    if deck.blackjack?(player1, plyr, bet); break; end
    p "Do you want to hit or stand?"
    input = gets.chomp.downcase
    if input == "hit"
      player1 += deck.hand_new(1)
      if deck.bust?(player1, plyr, bet); break; end
    elsif input == "stand"
      break
    else
      p "Please respond with 'hit' or 'stay'"
    end
    deck.display(player1, "your")
  end
  deck.display(player1, "your")
  p "-------------"
  unless deck.blackjack?(player1, plyr, 0) || deck.bust?(player1, plyr, 0)
    while true
      if deck.hand_score(player2) <= 16
        p "Dealer hits"
        player2 += deck.hand_new(1)
        if deck.bust?(player2, plyr, -(bet)); break; end
      else
        p "Dealer stands"
        break
      end
    end
    p "-------------"
    unless deck.bust?(player2, plyr, 0)
      p player2
      p deck.compare_hands(player1, player2, plyr, bet)
    end
  end
  p "you have $#{plyr.money}"
  p "play again? or QUIT?"
end
