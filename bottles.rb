require_relative "english_number"
include EngNum

puts "how many bottles do we have on the wall?"

def sing(input)

  number = input
  start = input
  trigger = input

  while start - trigger <= 1
    if start - trigger == 1
      number = trigger
    end

    if start - trigger == 0
       sentence = " #{english_number(number)} bottles of beer on the wall, #{english_number(number)} bottles of beer! "
       sentence.gsub! " one bottles of", " one bottle of"
       sentence.gsub! "wall, one bottles", "wall one bottle"
     puts sentence
     trigger -= 1
    else
        sentence = "Take one down, pass it around, #{english_number(number)} bottles of beer on the wall"
        sentence.sub! "around, one bottles", "around, one bottle"
        sentence.sub! "around,  bottles", "around, zero bottles"
      puts sentence
      trigger -= 1
      p "----------------------------------------------------------------------"
    end
  end
end

input = gets.chomp.to_i

while input > 0
  sing(input)
  input -=1
end
