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

p "Let's play some Poker"
p "What's your name?"
name = gets.chomp
p "How many bots do you want to play against? (1 to 3)"
players = gets.chomp.to_i + 1
p players
p "How much do you want to play with?"
bnkroll = gets.chomp.to_i
plyr = Player.new(name, bnkroll)
p "Alright #{plyr.name}, let's play"
while true
  hands = []
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
  bet = bet * players
  deck = Game.new
  deck.shuffle_deck
  players.times do |x|
    _x = 1
    player_x = deck.hand_new(5)
    hands << player_x
    _x += 1
  end
  player1 = hands[0]
  remainder = deck.hand_new(52 - (players * 5))
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
  (players - 1).times do |x|
    hands[x+1] = hands[x+1].sort_by{|x| x[2]}
    p "opponent's turn"
    discard = deck.opponent(hands[x+1], 0)
    hand = hands[x+1]
    discard.each do |y|
      hands[x+1] = hands[x+1].map{|x|x == hand[y] ? remainder[0] : x}
      remainder.slice!(0)
    end
    x += 1
  end
  p "--------------------------------------"
  deck.display(player1, "your")

  (players - 1).times do |x|
    deck.display(hands[x + 1], "opponent #{x + 1}'s'")
    x += 1
  end

  wins = []
  (players - 1).times do |x, y|
    if deck.winner?(player1, hands[x + 1], bet)
      p "You beat opponent #{x + 1}"
      wins << hands[x + 1]
    else
      p "You lost to opponent #{x + 1}"
    end
    x += 1
  end
  if wins.count == (players - 1)
    plyr.money += (bet - bet/players)
    p "you win the $#{bet} pot"
  else
    plyr.money -= bet/players
    p "you lose the $#{bet} pot"
  end

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
