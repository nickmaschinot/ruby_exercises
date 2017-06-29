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


by = rand(5..15)
bx = 19
board[by][bx] = "B"


board.each do | item |
  puts item.join(" ")
end

bdirection = rand(0..1)

while true
  last_tick = Time.now
  loop do
    sleep 0.2
    if Time.now - last_tick >= 1
      last_tick += 1
    end


    board.each do | item |
      puts item.join(" ")
    end

    if bdirection == 0
      by += 1
      bx -= 1
      board[by-1][bx+1] = " "
      board[by][bx] = "B"
      if by+1 == 19 && bx-1 == 0
        bdirection = 2
      elsif bx-1 == 0
        bdirection = 3
      elsif by+1 == 19
        bdirection = 1
      end


    elsif bdirection == 1
      by -= 1
      bx -= 1
      board[by+1][bx+1] = " "
      board[by][bx] = "B"
      if by-1 == 0 && bx-1 == 0
        bdirection = 3
      elsif bx-1 == 0
        bdirection = 2
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
    p ""
    p ""
  end
end
