puts "Type some words for me, and I will give them back to you in alphabetical order."
text = []
counter = 0


while counter < 1
  input = gets.chomp
 if input == ""
   puts "here are the words you gave me in alphabetical order..."
   counter += 1
 else
   text.push(input)
   input = ""
 end
end

text = text.sort
puts text
