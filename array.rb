puts "Type some words for me, and I will give them back to you in alphabetical order."
text = []

while true
  input = gets.chomp
  input = input.split(/\W+/)
  break if input.empty?
  text << input
end

puts "here are the words you gave me in alphabetical order..."
text = text.to_s
text = text.split(/\W+/)
puts text.sort
