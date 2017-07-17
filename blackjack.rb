require_relative "cards"
require_relative "game_modules"
require 'date'
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
  player_hands = []
  p "place your bet or type QUIT"
  while true
    #handles bet input, and ending the game
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
  p "--------------------------------------"
  #generates and shuffles a new deck for each game
  deck = Game.new
  deck.shuffle_deck
  player1 = deck.hand_new(2)
  player_hands << player1
  player2 = deck.hand_new(2)
  #shows what the player has after the draw
  deck.display(player1, "your")
  p "--------------------------------------"
  #shows the dealer's hand, with one card face down
  deck.display_dealer(player2)
  p "--------------------------------------"
  while true
    #checks if player has blackjack
    if deck.blackjack?(player1, plyr, bet); break; end
    #lets player hit or stand
    p "Do you want to 'hit', 'double' down, or 'stand'?"
    input = gets.chomp.downcase
    if input == "hit"
      player1 += deck.hand_new(1)
      #checks for bust
      if deck.bust?(player1, plyr, bet, plyr.name); break; end
    elsif input == "split"
      if pair?(player1)
        player3 = player1.pop!
        player1 += deck.hand_new(1)
        player3 += deck.hand_new(1)
        player_hands << player3
      else
        p "you cant split unless you have a pair"
      end
    elsif input == "stand"
      break
    else
      p "Please respond with 'hit' or 'stay'"
    end
    deck.display(player1, "your")
  end
  deck.display(player1, "your")
  p "--------------------------------------"
  #runs script for dealer behavior,
  #unless the game has been ended by blackjack or bust
  unless deck.blackjack?(player1, plyr, 0) || deck.bust?(player1, plyr, 0, plyr.name)
    while true
      #dealer will hit unless he has 16
      if deck.hand_score(player2) <= 16
        p "Dealer hits"
        player2 += deck.hand_new(1)
        if deck.bust?(player2, plyr, -(bet), "The dealer"); break; end
      else
        p "Dealer stands"
        break
      end
    end
    #unless the dealer has busted, the hands are evaluated against eachother
    unless deck.bust?(player2, plyr, 0, "The dealer")
      deck.display_dealer(player2)
      p "--------------------------------------"
      p deck.compare_hands(player1, player2, plyr, bet)
    end
  end
  f = File.new("#{File.absolute_path("blackjack_record")}/#{Date.today}.txt", "a")
  f.puts "#{plyr.name} at: #{Time.now}"
  f.puts "player hand value: #{deck.hand_score(player1)}"
  f.puts "dealer hand value: #{deck.hand_score(player2)}"
  f.puts "player money remaining: $#{plyr.money}"
  f.puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  f.close
  p "--------------------------------------"
  p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  p "--------------------------------------"
  p "you have $#{plyr.money}"
  p "play again? or QUIT?"
end
