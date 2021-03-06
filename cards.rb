
class Array
  def same_values?
    self.uniq.length == 1
  end
end

class Card < Array
  include Enumerable
  include Comparable
  @@cards = []
  def self.total_count
    @total_count ||= 0
  end
  def self.total_count=(n)
    @total_count = n
  end
  SUITS = ["spade", "heart", "diamond", "club"]
  NAMES = ["two", "three", "four", "five", "six", "seven", "eight", "nine",
           "ten", "jack", "queen", "king", "ace"]
  attr_reader :name, :suit, :value, :cards
  def initialize(name, suit)
    if name < 13
      @name  = NAMES[name]
    else
      raise ArgumentError, "name value #{name} is too large"
    end
    if SUITS.include?(suit)
      @suit  = suit
    else
      raise ArgumentError, "Unknown suit #{suit}"
    end
    @value = name + 2
    @@cards << [@name, @suit, @value]
    self.class.total_count += 1
  end
  def show_deck
    @@cards
  end
  def shuffle_deck
    @@cards.shuffle!
  end
  def draw_card(number)
    temp_hand = []
    number.times do |x|
      temp_hand << @@cards[x]
      x += 1
    end
    @@cards.slice!(0..number)
    temp_hand
  end
  def generate_suit(suit)
    13.times do |x|
      Card.new(x, suit)
      x += 1
    end
  end
end

class Deck < Card
  attr_reader :deck, :hand
  def initialize
    @deck = []
    @hand = []
    @deck << generate_suit("spade")
    @deck << generate_suit("heart")
    @deck << generate_suit("diamond")
    @deck << generate_suit("club")
  end
  def hand_new(size)
    @hand = draw_card(size)
  end
end
