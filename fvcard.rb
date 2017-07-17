require_relative "cards"
require_relative "game_modules"

class Game < Deck
  include FiveCardDraw
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

deck = Game.new
deck.shuffle_deck

def opponent(hand, pot)
  type = hand_type(hand)
  key = TYPES.index(type)
  values = values(hand)
  suits = suits(hand)
  discard = []
  save = []
  while true
    if key == 6 || key == 7 || key == 8
      discard = opponent_discard(hand)
    elsif key == 9
      discard = opponent_discard(hand)
    else
      break
    end
  end
end

def opponent_discard(hand)
  discard = []
  save = []
  hand.count.times do |x|
    p hand[x]
    if x < 4
      if hand[x][2] == hand[x+1][2] || hand[x][2] == hand[x-1][2]
        save << hand[x]
        p "yay"
      else
        discard << x
        p "nay"
      end
    end
    if x == 4
      if hand[x][2] == hand[x-1][2]
        save << hand[x]
        p "yay"
      else
        discard << x
        p "nay"
      end
    end
    x += 1
  end
  p "Your opponent discards #{discard.count}-cards"
  discard
end

def opponent_high_card_discard(hand)
  discard = []
  save = []
  hand.count.times do |x|
    if hand[x][2] > 10
      save << x
    else
      discard << x
    end
  end
  p "Your opponent discards #{discard.count}-cards"
  discard
end


pot = 100

sample_hand = deck.hand_new(5)
player2 = deck.hand_new(5)
remainder = deck.hand_new(42)

sample_hand = sample_hand.sort_by{|x| x[2]}
discard = []
save = []
x = 0

p sample_hand

p opponent_high_card_discard(sample_hand)
discard = opponent_high_card_discard(sample_hand)
p discard
discard.each do |y|
  sample_hand = sample_hand.map{|x|x == sample_hand[y] ? remainder[0] : x}
  remainder.slice!(0)
end
p sample_hand
p save
p discard
p sample_hand
p pot


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
        p "You have $#{plyr.money} remaining"
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
  player2 = deck.hand_new(5)
  remainder = deck.hand_new(42)
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
      input = input.scan(/\w/)
      input.each do |number|
        number = number.to_i - 1
        if discard.include?(number)
          discard.slice!(number)
          p "no longer discarding the #{player1[number][0]} of #{player1[number][1]}s"
        else
          discard << number
          p "discarding the #{player1[number][0]} of #{player1[number][1]}s"
        end
      end
    end
  end
  discard.each do |y|
    player1 = player1.map{|x|x == player1[y] ? remainder[0] : x}
    p "You drew the #{remainder[0][0]} of #{remainder[0][1]}s"
    remainder.slice!(0)
  end
  deck.display(player1, "your")
  p "--------------------------------------"
  plyr.money += deck.score_hand(player1, bet)
  p "--------------------------------------"
  p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  p "--------------------------------------"
  if plyr.money == 0
    puts "Game over"
    break
  end
  p "you have $#{plyr.money}"
  p "play again? or QUIT?"
end

pot = 100
sample_hand = [["ten", "spade", 5], ["jack", "spade", 5],
["queen", "spade", 10], ["king", "heart", 10], ["ace", "spade", 12]]
sample_hand2 = [["ten", "spade", 5], ["jack", "spade", 5],
["queen", "heart", 10], ["king", "spade", 10], ["ace", "spade", 10]]
deck.winner?(sample_hand, sample_hand2, pot)
p pot
