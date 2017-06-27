require_relative "cards"
require_relative "game_modules"
class Game < Deck
  include Blackjack
  def initialize
    super
  end
end

deck = Game.new
p deck.show_deck
p deck.shuffle_deck
player1 = deck.hand_new(3)
player2 = deck.hand_new(3)
p player1[1][2]
p deck.hand_score(player1)
p deck.hand_score(player2)
p deck.compare_hands(player1, player2)
p deck.show_deck
