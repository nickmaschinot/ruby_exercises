puts "Hello, would you like to calculate C to F, F to C, or quit the program?"

def c_to_f(c)
  temp = (c * 9/5) + 32
  puts "Here is your temp in Fahrenheit #{temp}"
end

def f_to_c(f)
  temp = ((f - 32) * 5/9)
  puts "here is your temp in Celsius #{temp}"
end

while true
  puts "Type 'A', 'B', or 'QUIT'"
  input = gets.chomp.upcase
  if input == "A"
    puts "What Celsius temp are we starting with?"
    cel = gets.chomp.to_i
    c_to_f(cel)
  elsif input == "B"
    puts "What Fahrenheit temp are we starting with?"
    fah = gets.chomp.to_i
    f_to_c(fah)
  elsif input == "QUIT"
    puts "Goodbye"
    break
  else
    puts "Please write A, B, or QUIT"
  end
  puts "Try again?"
end
