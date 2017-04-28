board = []


b1 = ["W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W"]
b2 = ["W", "W", "W", "/", "^", "^", "^", "^", "^", "^", "V", "W", "W", "W"]
b3 = ["W", "W", "/", " ", " ", " ", " ", " ", " ", " ", " ", "V", "W", "W"]
b4 = ["W", "/", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", "V", "W"]
b5 = ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
b6 = ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
b7 = ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
b8 = ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
b9 = ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
b10 = ["W", "|", " ", " ", " ", "G", "G", "G", "G", "-", "-", "-", "|", "W"]
b11 = ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
b12 = ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
b13 = ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
b14 = ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
b15 = ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
b16 = ["W", "|", " ", " ", " ", "G", "G", "G", "G", " ", " ", " ", "|", "W"]
b17 = ["W", "/", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", "V", "W"]
b18 = ["W", "W", "/", " ", " ", " ", " ", " ", " ", " ", " ", "V", "W", "W"]
b19 = ["W", "W", "W", "/", "^", "^", "^", "^", "^", "^", "V", "W", "W", "W"]
b20 = ["W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W", "W"]

board.push b1
board.push b2
board.push b3
board.push b4
board.push b5
board.push b6
board.push b7
board.push b8
board.push b9
board.push b10
board.push b11
board.push b12
board.push b13
board.push b14
board.push b15
board.push b16
board.push b17
board.push b18
board.push b19
board.push b20


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
  elsif y == 0 || y == 20
    puts "You crashed!"
    return
  end
  board[y][x] = "C"

  board.each do | item |
    puts item.join(" ")
  end
end
