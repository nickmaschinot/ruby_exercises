board=[]

board.push ["W", "W", "W", "W", "W", "W", "W", "W", "W", "W",
      "W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W"]
board.push ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
board.push ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
board.push ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
board.push ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
board.push ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
board.push ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
board.push ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
board.push ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
board.push ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
board.push ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
board.push ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
board.push ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
board.push ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
board.push ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
board.push ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
board.push ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
board.push ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
board.push ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", " ", " ", " ", " ", " ", " ", " ", " ", "|"]
board.push ["W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W",
       "W", "W", "W", "W", "W", "W", "W", "W", "W", "W"]


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


#puts "set difficulty: 'easy' or 'hard'?"
#difficulty = gets.chomp.upcase
#if difficulty == "easy"
#  puts "easy does it"
#elsif difficulty



while true

  puts "use 'W', and 'S' to move the paddle around to block the ball, or 'D' to wait"
  last_tick = Time.now
  loop do
    sleep 0.5
  if Time.now - last_tick >= 1
      last_tick += 1
  elsif direction == "W"
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
  elsif direction == ""
    puts "wait"
  else
    puts "Please use WASD"
  end

  board[y][x] = "H"
  board[y-1][x] = "H"
  board[y-2][x] = "H"
  board[y-3][x] = "H"
  board[y-4][x] = "H"

  board.each do | item |
    puts item.join(" ")
  end

  if bdirection == 0
    by += 1
    bx -= 1
    board[by-1][bx+1] = " "
    board[by][bx] = "B"
    if board[by+1][bx-1] == "H"
      bdirection = 3
    elsif bx-1 == 0
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
    if by-1 == 0 && bx+1 == 20
      bdirection = 0
    elsif by-1 == 0
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
    elsif by+1 == 19
    bdirection = 2
    end
  end
end
end
