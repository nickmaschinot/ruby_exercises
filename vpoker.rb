require_relative "cards"
require_relative "game_modules"
class Game < Deck
  include VideoPoker
  attr_reader :title
  def initialize
    super
    @title = ""
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


player = Player.new("Nick", 1000)
deck = Game.new
deck.shuffle_deck
hand = deck.hand_new(5)

deck.display(hand, "your")

sample_hand = [["eight", "spade", 8], ["eight", "heart", 9], ["queen", "spade", 11],
               ["king", "diamond", 11], ["jack", "heart", 13]]

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
