class GameBoard < Array
  attr_reader :board, :gboard
  def initialize
    @board = []
    x = 1
    81.times do |x|
      @board << (x % 9) + 1
      x += 1
    end
    @board
  end
end

def arrange_board(fill)
  temp_array = []
  81.times do |x,y|
    x = 0
    y = 0
    value = rand(1..9)
    while true
      if fill[x][0..8] == value || fill[0..8][y] == value
        value = rand(1..9)
      elsif x <= 2 && y <= 2 && fill[0..2][0..2] == value
           value = rand(1..9)
      elsif (2 < x && x <= 5) && (y <= 2) && fill[3..5][0..2] == value
           value = rand(1..9)
      elsif (5 < x && x <= 8) && y <= 2 && fill[6..8][0..2] == value
           value = rand(1..9)
      elsif x <= 2 && (2 < y && y <= 5) && fill[0..2][3..5] == value
           value = rand(1..9)
      elsif (2 < x && x <= 5) && (2 < y && y <= 5) && fill[3..5][3..5] == value
           value = rand(1..9)
      elsif (5 < x && x <= 8) && (2 < y && y <= 5) && fill[6..8][3..5] == value
            value = rand(1..9)
      elsif x <= 2 && (5 < y && y <= 8) && fill[0..2][6..8] == value
            value = rand(1..9)
      elsif (2 < x && x <= 5) && (5 < y && y <= 8) && fill[3..5][6..8] == value
            value = rand(1..9)
      elsif (5 < x && x <= 8) && (5 < y && y <= 8) && fill[6..8][6..8] == value
            value = rand(1..9)
      else
        fill.map! do |element, value|
          if(element == 10)
            value
          else
            element
          end
        end
        break
      end
    end
    if x < 8
      x += 1
    elsif x == 8
      y += 1
      x = 0
    end
  end
  fill
end

gboard = Array.new(9){Array.new(9,10)}
board = GameBoard.new
p gboard[8][8]
board = arrange_board(gboard)
p board
