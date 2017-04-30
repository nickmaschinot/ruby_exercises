
$board=[]


b1 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", "|"]
b2 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", "|"]
b3 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", "|"]
b4 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", "|"]
b5 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", "|"]
b6 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", "|"]
b7 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", "|"]
b8 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", "|"]
b9 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", "|"]
b10 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", "|"]
b11 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", "|"]
b12 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", "|"]
b13 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", "|"]
b14 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", "|"]
b15 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", "|"]
b16 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", "|"]
b17 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", "|"]
b18 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", "|"]
b19 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", "|"]
b20 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", "|"]
b21 = ["|", " ", " ", " ", " ", " ", " ", " ", " ", " ",
       " ", "|"]
b22 = ["|", "-", "-", "-", "-", "-", "-", "-", "-", "-",
       "-", "|"]



$board.push b1; $board.push b2; $board.push b3; $board.push b4; $board.push b5
$board.push b6; $board.push b7; $board.push b8; $board.push b9; $board.push b10
$board.push b11; $board.push b12; $board.push b13; $board.push b14; $board.push b15
$board.push b16; $board.push b17; $board.push b18; $board.push b19; $board.push b20
$board.push b21; $board.push b22

def square
  y = 1
  x = 5

  $board[y][x] = "S"
  $board[y+1][x] = "S"
  $board[y][x+1] = "S"
  $board[y+1][x+1] = "S"

  $board.each do | item |
    puts item.join(" ")
  end
  while true
    puts "use 'A', 'S' and 'D' to move the block, or 'D' to rotate"
    direction = gets.chomp.upcase

    if direction == "A"
      y += 1
      x -= 1
      $board[y-1][x+1] = " "
      $board[y-1][x+2] = " "
      $board[y][x+2] = " "

    elsif direction == "S"
      y += 1
      $board[y-1][x] = " "
      $board[y-1][x+1] = " "
    elsif direction == "D"
      y += 1
      x += 1
      $board[y-1][x-1] = " "
      $board[y-1][x] = " "
      $board[y][x-1] = " "
    else
      puts "Please use WASD"
    end

    if x-1 == -1
      x = 1
    end
    if y+1 == 21
      y = 19
    end
    if x+1 == 11
      x = 9
    end
    if x-2 == 0
      x = 2
    end

    $board[y][x] = "S"
    $board[y+1][x] = "S"
    $board[y][x+1] = "S"
    $board[y+1][x+1] = "S"




    $board.each do | item |
      puts item.join(" ")
    end
  end
end

def left
  y = 2
  x = 5
  position = 0

  $board[y][x] = "U"
  $board[y+1][x] = "U"
  $board[y][x-1] = "U"
  $board[y-1][x-1] = "U"

  $board.each do | item |
    puts item.join(" ")
  end

  while true
    puts "use 'A', 'S' and 'D' to move the block, or 'W' to rotate"
    direction = gets.chomp.upcase

    if position == 0

      if direction == "A"
        y += 1
        x -= 1
        $board[y-1][x+1] = " "
        $board[y-1][x] = " "
        $board[y-2][x] = " "
        $board[y][x+1] = " "

      elsif direction == "S"
        y += 1
        $board[y-2][x-1] = " "
        $board[y-1][x] = " "
      elsif direction == "D"
        y += 1
        x += 1
        $board[y-2][x-2] = " "
        $board[y-1][x-2] = " "
        if x == 11
          $board[y-1][x-1] = " "
        end
      elsif direction == "W"

        position = 1
        $board[y-1][x-1] = " "
        $board[y][x-1] = " "
        $board[y][x] = "U"
        $board[y+1][x] = "U"
        $board[y+1][x-1] = "U"
        $board[y][x+1] = "U"

        $board.each do | item |
          puts item.join(" ")
        end
        next
      else
        puts "Please use WASD"
      end
    end

    if position == 1

      if direction == "A"
        y += 1
        x -= 1
        $board[y-1][x+1] = " "
        $board[y-1][x+2] = " "
        $board[y][x-1] = " "
      elsif direction == "S"
        y += 1
        $board[y][x-1] = " "
        $board[y-1][x+1] = " "
        $board[y-1][x] = " "
      elsif direction == "D"
        y += 1
        x += 1
        $board[y-1][x-1] = " "
        $board[y-1][x] = " "
        $board[y][x-1] = " "
        $board[y][x-2] = " "
      elsif direction == "W"
        position = 0
        $board[y+1][x-1] = " "
        $board[y][x+1] = " "
        $board[y][x] = "U"
        $board[y+1][x] = "U"
        $board[y][x-1] = "U"
        $board[y-1][x-1] = "U"

        $board.each do | item |
          puts item.join(" ")
        end
      else
        puts "Please use WASD"
      end
    end

    if position == 0

      if x-2 == -1
        x = 2
      end
      if y+1 == 21
        y = 19
      end
      if x+1 == 12
        x = 10
      end
      if x-2 == 0
        x = 2
      end

      $board[y][x] = "U"
      $board[y+1][x] = "U"
      $board[y][x-1] = "U"
      $board[y-1][x-1] = "U"

      $board.each do | item |
        puts item.join(" ")
      end
    end

    if position == 1

      if x-2 == -1
        x = 2
      end
      if y+1 == 21
        y = 19
      end
      if x+1 == 12
        x = 10
      end
      if x-2 == 0
        x = 2
      end

      $board[y][x] = "U"
      $board[y+1][x] = "U"
      $board[y+1][x-1] = "U"
      $board[y][x+1] = "U"

      $board.each do | item |
        puts item.join(" ")
      end
    end


    $board.each do | item |
      puts item.join(" ")
    end
  end
end

def right
  y = 2
  x = 5
  position = 0

  $board[y][x] = "V"
  $board[y][x+1] = "V"
  $board[y+1][x] = "V"
  $board[y-1][x+1] = "V"

  $board.each do | item |
    puts item.join(" ")
  end

  while true
    puts "use 'A', 'S' and 'D' to move the block, or 'W' to rotate"
    direction = gets.chomp.upcase

    if position == 0

      if direction == "A"
        y += 1
        x -= 1
        $board[y-1][x+1] = " "
        $board[y-1][x+2] = " "
        $board[y-2][x+2] = " "

      elsif direction == "S"
        y += 1
        $board[y-2][x+1] = " "
        $board[y-1][x] = " "
      elsif direction == "D"
        y += 1
        x += 1
        $board[y-2][x] = " "
        $board[y-1][x] = " "
        $board[y-1][x-1] = " "
        $board[y][x-1] = " "

      elsif direction == "W"

        position = 1
        $board[y-1][x+1] = " "
        $board[y+1][x] = " "
        $board[y][x] = "V"
        $board[y-1][x] = "V"
        $board[y-1][x-1] = "V"
        $board[y][x+1] = "V"

        $board.each do | item |
          puts item.join(" ")
        end
        next
      else
        puts "Please use WASD"
      end
    end

    if position == 1

      if direction == "A"
        y += 1
        x -= 1
        $board[y-1][x+1] = " "
        $board[y-1][x+2] = " "
        $board[y-2][x] = " "
        $board[y-2][x+1] = " "
      elsif direction == "S"
        y += 1
        $board[y-2][x-1] = " "
        $board[y-2][x] = " "
        $board[y-1][x+1] = " "
      elsif direction == "D"
        y += 1
        x += 1
        $board[y-2][x-2] = " "
        $board[y-2][x-1] = " "
        $board[y][x-1] = " "
        $board[y][x-2] = " "
      elsif direction == "W"
        position = 0
        $board[y-1][x-1] = " "
        $board[y-1][x] = " "
        $board[y][x] = "V"
        $board[y][x+1] = "V"
        $board[y+1][x] = "V"
        $board[y-1][x+1] = "V"

        $board.each do | item |
          puts item.join(" ")
        end
      else
        puts "Please use WASD"
      end
    end

    if position == 0

      if x-1 == -1
        x = 1
      end
      if y+1 == 21
        y = 19
      end
      if x+1 == 11
        x = 9
      end
      if x-2 == 0
        x = 2
      end

      $board[y][x] = "V"
      $board[y][x+1] = "V"
      $board[y+1][x] = "V"
      $board[y-1][x+1] = "V"

      $board.each do | item |
        puts item.join(" ")
      end
    end

    if position == 1

      if x-2 == -1
        x = 2
      end
      if y+1 == 22
        y = 20
        break
      end
      if x+1 == 12
        x = 10
      end
      if x-2 == 0
        x = 2
      end

      $board[y][x] = "V"
      $board[y-1][x] = "V"
      $board[y-1][x-1] = "V"
      $board[y][x+1] = "V"

      $board.each do | item |
        puts item.join(" ")
      end
    end


    $board.each do | item |
      puts item.join(" ")
    end
  end
end

def straight
  y = 2
  x = 5
  position = 0

  $board[y][x] = "Y"
  $board[y-1][x] = "Y"
  $board[y+1][x] = "Y"
  $board[y+2][x] = "Y"

  $board.each do | item |
    puts item.join(" ")
  end

  while true
    puts "use 'A', 'S' and 'D' to move the block, or 'W' to rotate"
    direction = gets.chomp.upcase

    if position == 0

      if direction == "A"
        y += 1
        x -= 1
        $board[y-2][x+1] = " "
        $board[y-1][x+1] = " "
        $board[y][x+1] = " "
        $board[y+1][x+1] = " "

      elsif direction == "S"
        y += 1
        $board[y-2][x] = " "
      elsif direction == "D"
        y += 1
        x += 1
        $board[y-2][x-1] = " "
        $board[y-1][x-1] = " "
        $board[y][x-1] = " "
        $board[y+1][x-1] = " "

      elsif direction == "W"

        position = 1
        $board[y-1][x] = " "
        $board[y+1][x] = " "
        $board[y+2][x] = " "
        $board[y][x] = "Y"
        $board[y][x+1] = "Y"
        $board[y][x+2] = "Y"
        $board[y][x-1] = "Y"

        $board.each do | item |
          puts item.join(" ")
        end
        next
      else
        puts "Please use WASD"
      end
    end

    if position == 1

      if direction == "A"
        y += 1
        x -= 1
        $board[y-1][x] = " "
        $board[y-1][x+1] = " "
        $board[y-1][x+2] = " "
        $board[y-1][x+3] = " "
      elsif direction == "S"
        y += 1
        $board[y-1][x-1] = " "
        $board[y-1][x] = " "
        $board[y-1][x+1] = " "
        $board[y-1][x+2] = " "
      elsif direction == "D"
        y += 1
        x += 1
        $board[y-1][x-2] = " "
        $board[y-1][x-1] = " "
        $board[y-1][x] = " "
        $board[y-1][x+1] = " "
      elsif direction == "W"
        position = 0
        $board[y][x-1] = " "
        $board[y][x+1] = " "
        $board[y][x+2] = " "
        $board[y][x] = "Y"
        $board[y-1][x] = "Y"
        $board[y+1][x] = "Y"
        $board[y+2][x] = "Y"

        $board.each do | item |
          puts item.join(" ")
        end
      else
        puts "Please use WASD"
      end
    end

    if position == 0

      if x-1 == -1
        x = 1
      end
      if y+1 == 20
        y = 18
        break
      end
      if x+1 == 12
        x = 10
      end
      if x-2 == 0
        x = 2
      end

      $board[y][x] = "Y"
      $board[y-1][x] = "Y"
      $board[y+1][x] = "Y"
      $board[y+2][x] = "Y"

      $board.each do | item |
        puts item.join(" ")
      end
    end

    if position == 1

      if x-2 == -1
        x = 2
      end
      if y+1 == 22
        y = 20
        break
      end
      if x+1 == 10
        x = 8
      end
      if x-2 == 0
        x = 2
      end

      $board[y][x] = "Y"
      $board[y][x+1] = "Y"
      $board[y][x+2] = "Y"
      $board[y][x-1] = "Y"

      $board.each do | item |
        puts item.join(" ")
      end
    end


    $board.each do | item |
      puts item.join(" ")
    end
  end
end

def bend_L
  y = 2
  x = 5
  position = 0

  $board[y][x] = "W"
  $board[y-1][x] = "W"
  $board[y+1][x] = "W"
  $board[y+1][x-1] = "W"

  $board.each do | item |
    puts item.join(" ")
  end

  while true
    puts "use 'A', 'S' and 'D' to move the block, or 'W' to rotate"
    direction = gets.chomp.upcase

    if position == 0

      if direction == "A"
        y += 1
        x -= 1
        $board[y-2][x+1] = " "
        $board[y-1][x+1] = " "
        $board[y][x+1] = " "
        if x == 1
          $board[y][x] = " "
        end

      elsif direction == "S"
        y += 1
        $board[y-2][x] = " "
        $board[y][x-1] = " "
      elsif direction == "D"
        y += 1
        x += 1
        $board[y-1][x-1] = " "
        $board[y-2][x-1] = " "
        $board[y][x-1] = " "
        $board[y][x-2] = " "

      elsif direction == "W"

        position = 1
        $board[y-1][x] = " "
        $board[y+1][x] = " "
        $board[y+1][x-1] = " "
        $board[y][x] = "W"
        $board[y][x+1] = "W"
        $board[y][x-1] = "W"
        $board[y+1][x+1] = "W"

        $board.each do | item |
          puts item.join(" ")
        end
        next
      else
        puts "Please use WASD"
      end
    end

    if position == 1

      if direction == "A"
        y += 1
        x -= 1
        $board[y-1][x] = " "
        $board[y-1][x+1] = " "
        $board[y-1][x+2] = " "
        $board[y][x+2] = " "
      elsif direction == "S"
        y += 1
        $board[y-1][x-1] = " "
        $board[y-1][x] = " "
        $board[y-1][x+1] = " "

      elsif direction == "D"
        y += 1
        x += 1
        $board[y-1][x-2] = " "
        $board[y-1][x-1] = " "
        $board[y-1][x] = " "

      elsif direction == "W"
        position = 2
        $board[y+1][x+1] = " "
        $board[y][x+1] = " "
        $board[y][x-1] = " "
        $board[y][x] = "W"
        $board[y-1][x] = "W"
        $board[y+1][x] = "W"
        $board[y-1][x+1] = "W"

        $board.each do | item |
          puts item.join(" ")
        end
        next
      else
        puts "Please use WASD"
      end
    end

    if position == 2

      if direction == "A"
        y += 1
        x -= 1
        $board[y-2][x+1] = " "
        $board[y-2][x+2] = " "
        $board[y][x+1] = " "
      elsif direction == "S"
        y += 1
        $board[y-2][x] = " "
        $board[y-2][x+1] = " "

      elsif direction == "D"
        y += 1
        x += 1
        $board[y-2][x] = " "
        $board[y-2][x-1] = " "
        $board[y-1][x-1] = " "
        $board[y][x-1] = " "

      elsif direction == "W"
        position = 3
        $board[y-1][x] = " "
        $board[y-1][x+1] = " "
        $board[y+1][x] = " "
        $board[y][x] = "W"
        $board[y][x-1] = "W"
        $board[y-1][x-1] = "W"
        $board[y][x+1] = "W"


        $board.each do | item |
          puts item.join(" ")
        end
        next
      else
        puts "Please use WASD"
      end
    end

    if position == 3

      if direction == "A"
        y += 1
        x -= 1
        $board[y-2][x] = " "
        $board[y-1][x] = " "
        $board[y-1][x+1] = " "
        $board[y-1][x+2] = " "
      elsif direction == "S"
        y += 1
        $board[y-2][x-1] = " "
        $board[y-1][x] = " "
        $board[y-1][x+1] = " "

      elsif direction == "D"
        y += 1
        x += 1
        $board[y-2][x-2] = " "
        $board[y-1][x-2] = " "
        $board[y-1][x] = " "
        if x == 10
          $board[y-1][x-1] = " "
        end

      elsif direction == "W"
        position = 0
        $board[y-1][x-1] = " "
        $board[y][x-1] = " "
        $board[y][x+1] = " "
        $board[y][x] = "W"
        $board[y-1][x] = "W"
        $board[y+1][x] = "W"
        $board[y+1][x-1] = "W"


        $board.each do | item |
          puts item.join(" ")
        end
        next
      else
        puts "Please use WASD"
      end
    end

    if position == 0

      if x-1 == 0
        x = 2
      end
      if y+1 == 21
        y = 19
        break
      end
      if x+1 == 12
        x = 10
      end
      if x-2 == 0
        x = 2
      end

      $board[y][x] = "W"
      $board[y-1][x] = "W"
      $board[y+1][x] = "W"
      $board[y+1][x-1] = "W"

    end

    if position == 1

      if x-2 == -1
        x = 2
      end
      if y+1 == 21
        y = 19
        break
      end
      if x+1 == 11
        x = 9
      end
      if x-2 == 0
        x = 2
      end

      $board[y][x] = "W"
      $board[y][x+1] = "W"
      $board[y][x-1] = "W"
      $board[y+1][x+1] = "W"
    end

    if position == 2

      if x-1 == -1
        x = 1
      end
      if y+1 == 21
        y = 19
        break
      end
      if x+1 == 11
        x = 9
      end
      if x-2 == 0
        x = 2
      end

      $board[y][x] = "W"
      $board[y-1][x] = "W"
      $board[y+1][x] = "W"
      $board[y-1][x+1] = "W"
    end

    if position == 3

      if x-1 == 0
        x = 2
      end
      if y+1 == 22
        y = 20
        break
      end
      if x+1 == 11
        x = 9
      end
      if x-2 == 0
        x = 2
      end

      $board[y][x] = "W"
      $board[y][x-1] = "W"
      $board[y-1][x-1] = "W"
      $board[y][x+1] = "W"
    end


    $board.each do | item |
      puts item.join(" ")
    end
  end
end

def bend_R
  y = 2
  x = 5
  position = 0

  $board[y][x] = "X"
  $board[y-1][x] = "X"
  $board[y+1][x] = "X"
  $board[y+1][x+1] = "X"

  $board.each do | item |
    puts item.join(" ")
  end

  while true
    puts "use 'A', 'S' and 'D' to move the block, or 'W' to rotate"
    direction = gets.chomp.upcase

    if position == 0

      if direction == "A"
        y += 1
        x -= 1
        $board[y-2][x+1] = " "
        $board[y-1][x+1] = " "
        $board[y][x+1] = " "
        $board[y][x+2] = " "
      elsif direction == "S"
        y += 1
        $board[y-2][x] = " "
        $board[y][x+1] = " "
      elsif direction == "D"
        y += 1
        x += 1
        $board[y-1][x-1] = " "
        $board[y-2][x-1] = " "
        $board[y][x-1] = " "
        if x == 10
          $board[y][x] = " "
        end

      elsif direction == "W"

        position = 1
        $board[y-1][x] = " "
        $board[y+1][x] = " "
        $board[y+1][x+1] = " "
        $board[y][x] = "X"
        $board[y][x+1] = "X"
        $board[y][x-1] = "X"
        $board[y-1][x+1] = "X"

        $board.each do | item |
          puts item.join(" ")
        end
        next
      else
        puts "Please use WASD"
      end
    end

    if position == 1

      if direction == "A"
        y += 1
        x -= 1
        $board[y-1][x] = " "
        $board[y-1][x+2] = " "
        $board[y-2][x+2] = " "
        if x == 1
          $board[y-1][x+1] = " "
        end
      elsif direction == "S"
        y += 1
        $board[y-1][x-1] = " "
        $board[y-1][x] = " "
        $board[y-2][x+1] = " "
      elsif direction == "D"
        y += 1
        x += 1
        $board[y-1][x-2] = " "
        $board[y-1][x-1] = " "
        $board[y-1][x] = " "
        $board[y-2][x] = " "
      elsif direction == "W"
        position = 2
        $board[y-1][x+1] = " "
        $board[y][x+1] = " "
        $board[y][x-1] = " "
        $board[y][x] = "X"
        $board[y-1][x] = "X"
        $board[y+1][x] = "X"
        $board[y-1][x-1] = "X"

        $board.each do | item |
          puts item.join(" ")
        end
        next
      else
        puts "Please use WASD"
      end
    end

    if position == 2

      if direction == "A"
        y += 1
        x -= 1
        $board[y-2][x+1] = " "
        $board[y-2][x] = " "
        $board[y-1][x+1] = " "
        $board[y][x+1] = " "
      elsif direction == "S"
        y += 1
        $board[y-2][x] = " "
        $board[y-2][x-1] = " "

      elsif direction == "D"
        y += 1
        x += 1
        $board[y-2][x-2] = " "
        $board[y-2][x-1] = " "
        $board[y][x-1] = " "
      elsif direction == "W"
        position = 3
        $board[y-1][x] = " "
        $board[y-1][x-1] = " "
        $board[y+1][x] = " "
        $board[y][x] = "X"
        $board[y][x-1] = "X"
        $board[y+1][x-1] = "X"
        $board[y][x+1] = "X"


        $board.each do | item |
          puts item.join(" ")
        end
        next
      else
        puts "Please use WASD"
      end
    end

    if position == 3

      if direction == "A"
        y += 1
        x -= 1
        $board[y-1][x] = " "
        $board[y-1][x+1] = " "
        $board[y-1][x+2] = " "
      elsif direction == "S"
        y += 1
        $board[y-1][x-1] = " "
        $board[y-1][x] = " "
        $board[y-1][x+1] = " "

      elsif direction == "D"
        y += 1
        x += 1
        $board[y-1][x-2] = " "
        $board[y-1][x-1] = " "
        $board[y-1][x] = " "
        $board[y][x-2] = " "

      elsif direction == "W"
        position = 0
        $board[y+1][x-1] = " "
        $board[y][x-1] = " "
        $board[y][x+1] = " "
        $board[y][x] = "X"
        $board[y-1][x] = "X"
        $board[y+1][x] = "X"
        $board[y+1][x+1] = "X"


        $board.each do | item |
          puts item.join(" ")
        end
        next
      else
        puts "Please use WASD"
      end
    end

    if position == 0

      if x-1 == -1
        x = 1
      end
      if y+1 == 22
        y = 20
        break
      end
      if x+1 == 11
        x = 9
      end


      $board[y][x] = "X"
      $board[y-1][x] = "X"
      $board[y+1][x] = "X"
      $board[y+1][x+1] = "X"

    end

    if position == 1

      if x-2 == -1
        x = 2
      end
      if y+1 == 22
        y = 20
        break
      end
      if x+1 == 11
        x = 9
      end
      if x-2 == 0
        x = 2
      end

      $board[y][x] = "X"
      $board[y][x-1] = "X"
      $board[y-1][x+1] = "X"
      $board[y][x+1] = "X"
    end

    if position == 2

      if x-1 == 0
        x = 2
      end
      if y+1 == 21
        y = 19
        break
      end
      if x+1 == 12
        x = 10
      end
      if x-2 == 0
        x = 2
      end

      $board[y][x] = "X"
      $board[y-1][x] = "X"
      $board[y+1][x] = "X"
      $board[y-1][x-1] = "X"
    end

    if position == 3

      if x-1 == 0
        x = 2
      end
      if y+1 == 21
        y = 19
        break
      end
      if x+1 == 11
        x = 9
      end
      if x-2 == 0
        x = 2
      end

      $board[y][x] = "X"
      $board[y][x-1] = "X"
      $board[y+1][x-1] = "X"
      $board[y][x+1] = "X"
    end


    $board.each do | item |
      puts item.join(" ")
    end
  end
end

def tee
  y = 2
  x = 5
  position = 2

  $board[y][x] = "T"
  $board[y-1][x] = "T"
  $board[y][x-1] = "T"
  $board[y][x+1] = "T"

  $board.each do | item |
    puts item.join(" ")
  end

  while true
    puts "use 'A', 'S' and 'D' to move the block, or 'W' to rotate"
    direction = gets.chomp.upcase

    if position == 0

      if direction == "A"
        y += 1
        x -= 1
        $board[y-2][x+1] = " "
        $board[y-1][x+1] = " "
        $board[y-1][x+2] = " "
        if x==1
          $board[y-1][x] = " "
        end
      elsif direction == "S"
        y += 1
        $board[y-2][x] = " "
        $board[y-1][x+1] = " "
        $board[y-1][x-1] = " "
      elsif direction == "D"
        y += 1
        x += 1
        $board[y-1][x-1] = " "
        $board[y-2][x-1] = " "
        $board[y-1][x-2] = " "
        if x==10
          $board[y-1][x] = " "
        end
      elsif direction == "W"

        position = 1
        $board[y][x+1] = " "
        $board[y][x] = "T"
        $board[y][x-1] = "T"
        $board[y+1][x] = "T"
        $board[y-1][x] = "T"

        $board.each do | item |
          puts item.join(" ")
        end
        next
      else
        puts "Please use WASD"
      end
    end

    if position == 1

      if direction == "A"
        y += 1
        x -= 1
        $board[y-2][x+1] = " "
        $board[y-1][x+1] = " "
        $board[y][x+1] = " "
        if x == 1
          $board[y-1][x] = " "
        end
      elsif direction == "S"
        y += 1
        $board[y-2][x] = " "
        $board[y-1][x-1] = " "
      elsif direction == "D"
        y += 1
        x += 1
        $board[y-1][x-2] = " "
        $board[y-1][x-1] = " "
        $board[y-2][x-1] = " "
      elsif direction == "W"
        position = 2
        $board[y-1][x] = " "
        $board[y][x] = "T"
        $board[y][x-1] = "T"
        $board[y][x+1] = "T"
        $board[y+1][x] = "T"

        $board.each do | item |
          puts item.join(" ")
        end
        next
      else
        puts "Please use WASD"
      end
    end

    if position == 2

      if direction == "A"
        y += 1
        x -= 1
        $board[y-1][x] = " "
        $board[y-1][x+1] = " "
        $board[y-1][x+2] = " "
      elsif direction == "S"
        y += 1
        $board[y-1][x-1] = " "
        $board[y-1][x] = " "
        $board[y-1][x+1] = " "
      elsif direction == "D"
        y += 1
        x += 1
        $board[y-1][x-2] = " "
        $board[y-1][x-1] = " "
        $board[y-1][x] = " "
      elsif direction == "W"
        position = 3
        $board[y][x-1] = " "
        $board[y][x] = "T"
        $board[y][x+1] = "T"
        $board[y+1][x] = "T"
        $board[y-1][x] = "T"


        $board.each do | item |
          puts item.join(" ")
        end
        next
      else
        puts "Please use WASD"
      end
    end

    if position == 3

      if direction == "A"
        y += 1
        x -= 1
        $board[y-2][x+1] = " "
        $board[y-1][x+1] = " "
        $board[y-1][x+2] = " "
      elsif direction == "S"
        y += 1
        $board[y-2][x] = " "
        $board[y-1][x+1] = " "
      elsif direction == "D"
        y += 1
        x += 1
        $board[y-2][x-1] = " "
        $board[y-1][x-1] = " "
        $board[y][x-1] = " "
        if x == 10
          $board[y-1][x] = " "
        end
      elsif direction == "W"
        position = 0
        $board[y+1][x] = " "
        $board[y][x] = "T"
        $board[y-1][x] = "T"
        $board[y][x-1] = "T"
        $board[y][x+1] = "T"


        $board.each do | item |
          puts item.join(" ")
        end
        next
      else
        puts "Please use WASD"
      end
    end

    if position == 0

      if x-1 == 0
        x = 2
      end
      if y+1 == 22
        y = 20
        break
      end
      if x+1 == 11
        x = 9
      end


      $board[y][x] = "T"
      $board[y-1][x] = "T"
      $board[y][x-1] = "T"
      $board[y][x+1] = "T"

    end

    if position == 1

      if x-1 == -1
        x = 1
      end
      if y+1 == 21
        y = 19
        break
      end
      if x+1 == 12
        x = 10
      end
      if x-2 == 0
        x = 2
      end

      $board[y][x] = "T"
      $board[y][x-1] = "T"
      $board[y+1][x] = "T"
      $board[y-1][x] = "T"
    end

    if position == 2

      if x-1 == 0
        x = 2
      end
      if y+1 == 21
        y = 19
        break
      end
      if x+1 == 11
        x = 9
      end
      if x-2 == 0
        x = 2
      end

      $board[y][x] = "T"
      $board[y][x-1] = "T"
      $board[y][x+1] = "T"
      $board[y+1][x] = "T"
    end

    if position == 3

      if x-1 == -1
        x = 1
      end
      if y+1 == 21
        y = 19
        break
      end
      if x+1 == 11
        x = 9
      end
      if x-2 == 0
        x = 2
      end

      $board[y][x] = "T"
      $board[y][x+1] = "T"
      $board[y+1][x] = "T"
      $board[y-1][x] = "T"
    end


    $board.each do | item |
      puts item.join(" ")
    end
  end
end

#ruby tetris.rb
tee
