require_relative "cards"
require_relative "game_modules"

class Game < Deck
  include VideoPoker
  attr_reader :title
  def initialize
    super
    @title = ""
  end
  def discard(hand, array)
    array.each do |y|
      hand = hand.map{|x|x == hand[y] ? hand_new(1).flatten : x}
    end
    hand
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


p "Let's play some Poker"
p "What's your name?"
name = gets.chomp
p "How much do you want to play with?"
bnkroll = gets.chomp.to_i
plyr = Player.new(name, bnkroll)
p "Alright #{plyr.name}, let's play"
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
        p "You have #{plyr.bnkroll} remaining"
        p "Place a smaller bet:"
      else
        break
      end
    end
  end
  p "--------------------------------------"
  deck = Game.new
  deck.shuffle_deck
  player1 = deck.hand_new(5)
  deck.display(player1, "your")
  p "--------------------------------------"
  p "what cards do you want to get rid of before you draw?"
  discard = []
  while true
    p "type '1', '2', '3', '4', '5' to discard the cards you dont want."
    p "and 'draw' to replace them."
    input = gets.chomp.downcase
    if input == "draw"
      discard
      break
    elsif input.count("a-z") > 0
      puts "Please only input integers or draw"
    elsif input.count("67890") > 0
      puts "only numbers 1 to 5 will discard a card"
    else
      input = input.to_i - 1
      discard << input
      p discard
      p "discarded the #{player1[input][0]} of #{player1[input][1]}s"
    end
    discard
  end
  p discard
  player1 = deck.discard(player1, discard)
  deck.display(player1, "your")
  p "--------------------------------------"
  plyr.money += deck.score_hand(player1, bet)
  p "--------------------------------------"
  p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  p "--------------------------------------"
  p "you have $#{plyr.money}"
  p "play again? or QUIT?"
end

deck.display(hand, "your")

sample_hand = [["ten", "spade", 10], ["jack", "heart", 12], ["queen", "spade", 12],
               ["king", "spade", 13], ["ace", "spade", 14]]

by_suit = []
by_value = []
sample_hand.each do |k|
  by_suit << k[1]
end
by_suit.sort!
sample_hand.each do |k|
  by_value << k[2]
end
by_value.sort!
frequency = by_value.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
p frequency
p frequency.values.last
#ruby vpoker.rb
p by_suit
p by_value
#p all_equal?(by_suit)
#p straight?(by_value)

type = deck.hand_type(sample_hand)
p type
p deck.score_hand(sample_hand, 3)

p sample_hand
