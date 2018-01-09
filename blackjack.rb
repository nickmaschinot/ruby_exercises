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

def record_write (plyr, player1, player2, deck)
  f = File.new("#{File.absolute_path("blackjack_record")}/#{Date.today}.txt", "a")
  f.puts "#{plyr.name} at: #{Time.now}"
  f.puts "player hand value: #{deck.hand_score(player1)}"
  f.puts "dealer hand value: #{deck.hand_score(player2)}"
  f.puts "player money remaining: $#{plyr.money}"
  f.puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  f.close
end

def record_simulation(plyr, bnkroll, rounds)
  f = File.new("#{File.absolute_path("blackjack_record")}/simulation/#{Date.today}.txt", "a")
  f.puts "#{plyr.name} at: #{Time.now}"
  f.puts "Rounds: #{rounds}"
  f.puts "Starting Funds: #{bnkroll}"
  f.puts "Ending Funds: #{plyr.money}"
  f.puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  f.close
end

def split_game(hand, plyr, bet, deck)
  deck.display(hand, "your")
  while true
    p "Do you want to 'hit', or 'stand'?"
    input = gets.chomp.downcase
    if input == "hit"
      hand += deck.hand_new(1)
      #checks for bust
      if deck.bust?(hand, plyr, bet, plyr.name); break; end
    elsif input == "stand"
      break
    else
      p "Please respond with 'hit' or 'stay'"
    end
    deck.display(hand, "your")
  end
  hand
end


def regular_play(bnkroll, plyr, rounds, bet)
  #generates and shuffles a new deck for each game
  original_bet = bet
  deck = Game.new
  deck.shuffle_deck
  player1 = deck.hand_new(2)
  #player1 = [["four", "spade", 4], ["four", "diamond", 4]]
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
    p "Do you want to 'hit', 'double' down, 'split', or 'stand'?"
    input = gets.chomp.downcase
    if input == "hit"
      player1 += deck.hand_new(1)
      #checks for bust
      if deck.bust?(player1, plyr, bet, plyr.name); break; end
    elsif input == "double" && player1.count < 3 && bet == original_bet
      bet = bet * 2
    elsif input == "double" && (player1.count > 2 || bet != original_bet)
      p "you can't double down now"
    elsif input == "split" && player1.count < 3
      if deck.pair?(player1)
        player3 = deck.hand_new(1)
        player3[1] = player1[1]
        player1.pop
        player1 += deck.hand_new(1)
        player3 = split_game(player3, plyr, bet, deck)
      else
        p "you can't split unless you have a pair"
      end
    elsif input == "stand"
      break
    else
      p "Please respond with 'hit' or 'stay'"
    end
    deck.display(player1, "your")
  end
  deck.display(player1, "your")
  final_hand = dealer(player1, player2, plyr, bet, deck)
  if player3 != nil && deck.hand_score(final_hand) > 21 &&
  deck.hand_score(player3) < 22
    plyr.money += bet
  elsif player3 != nil
    deck.display(player3, "your second")
    dealer(player3, final_hand, plyr, bet, deck)
  end

  p "--------------------------------------"
  p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  p "--------------------------------------"
  p "you have $#{plyr.money}"
  p "play again? or QUIT?"
end
  #runs script for dealer behavior,
  #unless the game has been ended by blackjack or bust
def dealer(player1, player2, plyr, bet, deck)
  unless deck.blackjack?(player1, plyr, 0) || deck.bust?(player1, plyr, 0, plyr.name)
    while true
      #dealer will hit unless he has 16
      if deck.hand_score(player2) <= 16
        p "Dealer hits"
        player2 += deck.hand_new(1)
        if deck.bust?(player2, plyr, -(bet), "The dealer")
          player2
          break
        end
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
  player2
end



def simulate_game(bnkroll, plyr, rounds)
  round_count = rounds - 1
  rounds.times do |bet, hand|
    p "round: #{rounds - round_count}"
    bet = 50
    while true
      puts "betting $#{bet}"
      deck = Game.new
      deck.shuffle_deck
      player1 = deck.hand_new(2)
      player2 = deck.hand_new(2)
      top_card = player2[1]
      original_money = plyr.money
      unless deck.blackjack?(player2, plyr, 0)
        while true
        #player will hit unless he has 16 or better
          if deck.hand_score(player1) > 12 && deck.hand_score(player1) <= 16
            if top_card[2] > 6
              player1 += deck.hand_new(1)
            else
              break
            end
          elsif deck.hand_score(player1) < 13
            p "wow thats a low hand"
            player1 += deck.hand_new(1)
          else
            break
          end
          if deck.bust?(player1, plyr, bet, "The player"); break; end
        end
      end
      unless (deck.blackjack?(player1, plyr, bet) &&
        deck.blackjack?(player2, plyr, 0) == false) ||
        deck.bust?(player1, plyr, 0, plyr.name)
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
          p "--------------------------------------"
          p deck.compare_hands(player1, player2, plyr, bet)
        end
      end
      p "you have $#{plyr.money}"
      f = File.new("#{File.absolute_path("blackjack_record")}/data/#{Date.today}.txt", "a")
      f.puts plyr.money
      f.close
      #record_write(plyr, player1, player2, deck)
      if plyr.money > original_money
        break
      elsif plyr.money == original_money
        puts "keeping bet at $#{bet}"
      else
        bet = bet * 2
        if bet > plyr.money
          puts "not enough money to continue simulation"
          record_simulation(plyr, bnkroll, rounds)
          return
        elsif bet > 20000
          f = File.new("#{File.absolute_path("blackjack_record")}/#{Date.today}.txt", "a")
          f.puts "#{plyr.name} at: #{Time.now}"
          f.puts "Round: #{rounds - round_count}"
          f.puts "Hand: #{hand}"
          f.puts "Danger bet: $#{bet}"
          f.puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
          f.close
          bet = 50
        end
        puts "now betting $#{bet}"
      end
    end
    round_count -= 1
  end
  record_simulation(plyr, bnkroll, rounds)
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
    elsif bet == "simulation"
      puts "Simulate for how many rounds?"
      rounds = gets.chomp.downcase
      if rounds == rounds.count("a-z") > 0
        puts "Please only input integers or quit"
      else
        rounds = rounds.to_i
        simulate_game(bnkroll, plyr, rounds)
        p "SIMULATION OVER"
        break
      end
    elsif bet.count("a-z") > 0
      puts "Please only input integers or quit"
    else
      bet = bet.to_i
      if bnkroll - bet < 0
        p "You dont have enough money to place that bet"
        p "You have #{bnkroll} remaining"
        p "Place a smaller bet:"
      else
        regular_play(bnkroll, plyr, rounds, bet)
        break
      end
    end
  end
  p "--------------------------------------"
end
