board=[]

b1 = ["W", "W", "W", "W", "W", "W", "W", "W", "W", "W",
      "W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W"]
b2 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
b3 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
b4 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
b5 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
b6 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
b7 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
b8 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
b9 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
b10 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
b11 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
b12 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
b13 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
b14 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
b15 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
b16 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", "|", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
b17 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
b18 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
b19 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
b20 = ["W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W",
       "W", "W", "W", "W", "W", "W", "W", "W", "W", "W"]

board.push b1; board.push b2; board.push b3; board.push b4; board.push b5
board.push b6; board.push b7; board.push b8; board.push b9; board.push b10
board.push b11; board.push b12; board.push b13; board.push b14; board.push b15
board.push b16; board.push b17; board.push b18; board.push b19; board.push b20

y = rand(5..15)
x = 2
board[y][x] = "H"
board[y-1][x] = "H"
board[y-2][x] = "H"
board[y-3][x] = "H"
board[y-4][x] = "H"

by = rand(5..15)
bx = 19
board[by][bx] = "B"


board.each do | item |
  puts item.join(" ")
end

bdirection = rand(0..1)

while true

  puts "use 'W', and 'S' to move the paddle around to block the ball, or 'D' to wait"
  direction = gets.chomp.upcase

  if direction == "W"
    y -= 1
    if y-4 == 0
      y = 5
    end
    board[y+1][x] = " "
  elsif direction == "S"
    y += 1
    if y == 19
      y = 18
    end
    board[y-5][x] = " "
  elsif direction == "D"
    puts "wait"
  else
    puts "Please use WASD"
  end

  board[y][x] = "H"
  board[y-1][x] = "H"
  board[y-2][x] = "H"
  board[y-3][x] = "H"
  board[y-4][x] = "H"

  if bdirection == 0
    by += 1
    bx -= 1
    board[by-1][bx+1] = " "
    board[by][bx] = "B"
    if board[by+1][bx-1] == "H"
      bdirection = 3
    elsif bx-1 == 0
      board[by+1][bx-1] = "B"
      puts "you lose!"
      return
    elsif by+1 == 19
      bdirection = 1
    end


  elsif bdirection == 1
      by -= 1
      bx -= 1
      board[by+1][bx+1] = " "
      board[by][bx] = "B"
      if board[by-1][bx-1] == "H"
      bdirection = 2
      elsif bx-1 == -1
      puts "you lose!"
      return
      elsif by-1 == 0
        bdirection = 0
      end


  elsif bdirection == 2
      by -= 1
      bx += 1
      board[by+1][bx-1] = " "
      board[by][bx] = "B"
      if by-1 == 0
        bdirection = 3
      elsif bx+1 == 20
        bdirection = 1
      end


    elsif bdirection == 3
      by += 1
      bx += 1
      board[by-1][bx-1] = " "
      board[by][bx] = "B"
      if bx+1 == 20 && by+1 == 19
      bdirection = 1
      elsif bx+1 == 20
      bdirection = 0
      end
    end




  board.each do | item |
    puts item.join(" ")
  end
end
