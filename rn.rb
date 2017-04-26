

def romanizer number
  m = number/1000
  number = number - m * 1000
  d = number/500
  number = number - d * 500
  c = number/100
  number = number - c * 100
  l = number/50
  number = number - l * 50
  x = number/10
  number = number - x * 10
  v = number/5
  number = number - v * 5
  i = number

    roman_numeral = "M" * m + "D" * d + "C" * c + "L" * l + "X" * x + "V" * v + "I" * i
    roman_numeral.sub! 'DCCCC', 'CM'
    roman_numeral.sub! 'CCCC', 'CD'
    roman_numeral.sub! 'CXXXX', 'XC'
    roman_numeral.sub! 'XXXX', 'XL'
    roman_numeral.sub! 'VIIII', 'IX'
    roman_numeral.sub! 'IIII', 'IV'

    puts "Here is your new Roman Numeral: "
    puts roman_numeral

end



#romanizer number




def de_romanizer nvmber
  nvmber.sub! 'CM', 'DCCCC'
  nvmber.sub! 'CD', 'CCCC'
  nvmber.sub! 'XC', 'CXXXX'
  nvmber.sub! 'XL', 'XXXX'
  nvmber.sub! 'IX', 'VIIII'
  nvmber.sub! 'IV', 'IIII'

  new_number = nvmber
  new_number = new_number.split("")
  engnum = 0

  m = 0
  d = 0
  c = 0
  l = 0
  x = 0
  v = 0
  i = 0

  new_number.each do |char|
    if char == "M"
      m += 1
    elsif char == "D"
      d += 1
    elsif char == "C"
      c += 1
    elsif char == "L"
      l += 1
    elsif char == "X"
      x += 1
    elsif char == "V"
      v += 1
    elsif char == "I"
      i += 1
    else
      puts "Invalid character detected. Please only use Roman Numerals"
      return
    end
  end

  engnum = m * 1000 + d * 500 + c * 100 + l * 50 + x * 10 + v * 5 + i
  puts "Here is your de-Romanized number: "
  puts engnum

end



puts "A. Would you like to make a regular number into a Roman Numeral?"
puts "B. Or would you like to make a Roman Numeral into a base-10 one?"
puts "Type 'A' or 'B' to pick an option, or 'QUIT' to leave the program"

input = gets.chomp.upcase

while true
  if input == "A"
    puts "give me a number and I'll give it back in Roman Numerals (Using up to 4-digits)"
    number = gets.chomp.to_i
    if number == "0"
      puts "Please only input positive integers"
      number = "X"
    end
    romanizer number
  elsif input == "B"
    puts "give me a Roman Numeral and I'll give it back in base-10"
    nvmber = gets.chomp.to_s
    de_romanizer nvmber
  elsif input == "QUIT"
    puts "Goodbye"
    break
  else
    puts "Please input either 'A', 'B', or 'QUIT'."
    input = gets.chomp.upcase
  end
  puts "Try again? 'A', 'B', or 'QUIT'"
  input = gets.chomp.upcase
end
