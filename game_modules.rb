module Blackjack
  def hand_score(hand)
    x = 0
    @score = 0
    hand.count.times do |x|
      if hand[x][2] <= 10
        @score += hand[x][2]
      elsif hand[x][2] <= 13
        @score += 10
      else
        @score += 11
      end
      x += 1
    end
    @score
  end
  def compare_hands(hand, other_hand)
    if hand_score(hand) > hand_score(other_hand)
      "Player 1 wins!"
    elsif hand_score(hand) < hand_score(other_hand)
      "Dealer wins"
    else
      "Tie"
    end
  end
end
