require_relative "english_number"
include EngNum

puts "give me a number and I'll give it back using words (Using up to 15 digits)"
while true
  number = gets.chomp.downcase
  if number == "quit"
    puts "Goodbye"
    break
  elsif number.count("a-z") > 0
    puts "Please only input integers"
  else
    number = number.to_i
    p "Here is your number: #{english_number(number)}"
  end
  puts "type another number? or QUIT?"
end
