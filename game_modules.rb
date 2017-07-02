

module Blackjack
  include Enumerable
  def hand_score(hand)
    x = 0
    aces = 0
    @score = 0
    hand.count.times do |x|
      if hand[x][2] <= 10
        @score += hand[x][2]
      elsif hand[x][2] <= 13
        @score += 10
      else
        @score += 11
        aces += 1
      end
      x += 1
    end
    if @score > 21 && aces > 0
      @score -= 9
      aces -= 1
    end
    @score
  end
  def compare_hands(hand, other_hand, plyr, bet)
    display(hand, "your")
    p "-------------"
    display(other_hand, "dealer's")
    if hand_score(hand) > hand_score(other_hand)
      p "Player wins!"
      plyr.money += bet
    elsif hand_score(hand) < hand_score(other_hand)
      p "Dealer wins"
      plyr.money -= bet
    else
      "Tie"
    end
  end
  def bust?(hand, plyr, bet)
    if hand_score(hand) > 21
      plyr.money -= bet
      p "#{hand} is busted!"
    end
  end
  def display(hand, name)
    x = 0
    p "#{name} hand:"
    hand.count.times do |x|
      p "#{hand[x][0]} of #{hand[x][1]}s"
      x += 1
    end
  end
  def display_dealer(hand)
    x = 1
    ticker = hand.count - 1
    p "Dealer shows:"
    p "----- of -----s"
    ticker.times do |x|
      p "#{hand[x][0]} of #{hand[x][1]}s"
      x += 1
    end
  end
  def blackjack?(hand, plyr, bet)
    if hand_score(hand) == 21 && hand.count == 2
      plyr.money += bet
      p "Blackjack, winner!!!"
      return true
    end
  end
end

module VideoPoker
  TYPES = ["Royal-Flush", "Straight-Flush", "Four-of-a-Kind", "Full House", "Flush",
            "Straight", "Three-of-a-kind", "Two-Pair", "Pair", "High-Card"]
  PRIZES = [250, 50, 25, 9, 6, 4, 3, 2, 1]
  def hand_type(hand)
    by_suit = []
    by_value = []
    hand.each do |k|
      by_suit << k[1]
    end
    by_suit.sort!
    hand.each do |k|
      by_value << k[2]
    end
    by_suit.sort!
    frequency = by_value.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    frequency.values.sort.reverse!

    if all_equal?(by_suit)
      if straight?(by_value)
        if hand_score(by_value) == 60
          TYPES[0]
        else
          TYPES[1]
        end
      else
        TYPES[4]
      end
    elsif straight?(by_value)
      TYPES[5]
    elsif frequency.values.sort.last == 4
      TYPES[2]
    elsif frequency.values.sort.last == 3
      if frequency.count == 2
        TYPES[3]
      else
        TYPES[6]
      end
    elsif frequency.values.sort.last == 2
      if frequency.count == 3
        TYPES[7]
      else
        if frequency.key(frequency.values.sort.last) >= 11
          TYPES[8]
        else
          TYPES[9]
        end
      end
    end
  end

  def winner?(title)
    return true unless title == TYPES[9]
  end

  def score_hand(hand, bet)
    type = hand_type(hand)
    payout = payout(bet, type)
    if winner?(type)
      p "You win with a #{type}"
      p "your payout is #{payout}"
      bet = payout
    else
      p "you lose"
      bet = -bet 
    end
  end

  def payout(bet, title)
    payout = ""
    case title
    when TYPES[0]
      payout = PRIZES[0]
    when TYPES[1]
      payout = PRIZES[1]
    when TYPES[2]
      payout = PRIZES[2]
    when TYPES[3]
      payout = PRIZES[3]
    when TYPES[4]
      payout = PRIZES[5]
    when TYPES[6]
      payout = PRIZES[6]
    when TYPES[7]
      payout = PRIZES[7]
    when TYPES[8]
      payout = PRIZES[8]
    end
    payout * bet
  end
  def hand_score(values)
    @score = 0
    values.count.times do |x|
        @score += values[x]
    end
    @score
  end
  def display(hand, name)
    x = 0
    p "#{name} hand: "
    hand.count.times do |x|
      print "#{hand[x][0]} of #{hand[x][1]}s | "
      x += 1
    end
  end
  def all_equal?(hand)
      hand.uniq.size <= 1
  end
  def straight?(hand)
    return false unless hand.size == 5
    hand.each_cons(2).all? {|a, b| b == a + 1 }
  end
end
