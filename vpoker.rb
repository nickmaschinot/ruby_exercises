require_relative "cards"
require_relative "game_modules"
class Game < Deck
  include VideoPoker
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
