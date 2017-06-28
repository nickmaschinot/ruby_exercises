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
