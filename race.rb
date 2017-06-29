board = []


board.push ["W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W"]
board.push ["W", "W", "W", "/", "^", "^", "^", "^", "^", "^", "V", "W", "W", "W"]
board.push ["W", "W", "/", " ", " ", " ", " ", " ", " ", " ", " ", "V", "W", "W"]
board.push ["W", "/", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", "V", "W"]
board.push ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
board.push ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
board.push ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
board.push ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
board.push ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
board.push ["W", "|", " ", " ", " ", "G", "G", "G", "G", "-", "-", "-", "|", "W"]
board.push ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
board.push ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
board.push ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
board.push ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
board.push ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
board.push ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
board.push ["W", "/", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", "V", "W"]
board.push ["W", "W", "/", " ", " ", " ", " ", " ", " ", " ", " ", "V", "W", "W"]
board.push ["W", "W", "W", "/", "^", "^", "^", "^", "^", "^", "V", "W", "W", "W"]
board.push ["W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W"]

y = 9
x = 10
board[y][x] = "C"

board.each do | item |
  puts item.join(" ")
end


while true

  puts "use 'W', 'A', 'S', 'D' to move the car around"
  direction = gets.chomp.upcase

  if direction == "W"
    y -= 1
    board[y+1][x] = " "
  elsif direction == "A"
    x -= 1
    board[y][x+1] = " "
  elsif direction == "D"
    x += 1
    board[y][x-1] = " "
  elsif direction == "S"
    y += 1
    board[y-1][x] = " "
  else
    puts "Please use WASD"
  end

  if x == 14 || x == 0
    puts "You crashed!"
    return 
  elsif y == 0 || y == 20
    puts "You crashed!"
    return
  end
  board[y][x] = "C"

  board.each do | item |
    puts item.join(" ")
  end
end
