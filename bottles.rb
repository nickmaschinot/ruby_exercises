puts "how many bottles do we have on the wall?"

def sing(input)


  ones_place = ["", "one ", "two ", "three ", "four ", "five ",
                "six ", "seven ", "eight ", "nine "]
  teens = ["", "eleven ", "twelve", "thirteen ", "fourteen ", "fifteen ",
    "sixteen ", "seventeen ", "eighteen ", "nineteen "]
  tens_place = ["", "ten ", "twenty ", "thirty ", "forty ", "fifty ",
    "sixty ", "seventy ", "eighty ", "ninety "]
  higher_place = ["", "hundred ", "thousand ", "million ",
    "billion ", "trillion "]

  number = input
  start = input
  trigger = input

  while start - trigger <= 1
    if start - trigger == 1
      number = trigger
    end

  dtrig = 0
  dhrig = 0
  htrig = 0

  d = number/1000
    if d >= 1
      dtrig = 2
      if d >= 100
        dhrig = 1
      end
    end
  number = number - d * 1000
     dn = d
     dh = dn/100
     dn = dn - dh * 100
     dt = dn/10
     dn = dn - dt * 10
  h = number/100
    if h >= 1
       htrig = 1
    end
  number = number - h * 100
     x = number/10
  number = number - x * 10
     n = number

  answer = ones_place[dh] + higher_place[dhrig] + tens_place[dt] + ones_place [dn] +
  higher_place[dtrig] + ones_place[h] + higher_place[htrig] + tens_place[x] +
  ones_place[n]

     answer.gsub! "ten nine", "nineteen"
     answer.gsub! "ten eight", "eighteen"
     answer.gsub! "ten seven", "seventeen"
     answer.gsub! "ten six", "sixteen"
     answer.gsub! "ten five", "fifteen"
     answer.gsub! "ten four", "fourteen"
     answer.gsub! "ten three", "thirteen"
     answer.gsub! "ten two", "twelve"
     answer.gsub! "ten one", "eleven"
     answer.gsub! " ", "-"
     answer = answer.chop

    if start - trigger == 0
       sentence = " #{answer} bottles of beer on the wall, #{answer} bottles of beer! "
       sentence.gsub! " one bottles of", " one bottle of"
       sentence.gsub! "wall, one bottles", "wall one bottle"
     puts sentence
     trigger -= 1
    else
        sentence = "Take one down, pass it around, #{answer} bottles of beer on the wall"
        sentence.sub! "around, one bottles", "around, one bottle"
        sentence.sub! "around,  bottles", "around, zero bottles"
      puts sentence
      trigger -= 1
    end
  end
end

input = gets.chomp.to_i

while input > 0
  sing(input)
  input -=1
end
