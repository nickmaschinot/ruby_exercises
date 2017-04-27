

def romanizer (number)
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

def de_romanizer (nvmber)
  nvmber.sub! 'CM', 'DCCCC'
  nvmber.sub! 'CD', 'CCCC'
  nvmber.sub! 'XC', 'CXXXX'
  nvmber.sub! 'XL', 'XXXX'
  nvmber.sub! 'IX', 'VIIII'
  nvmber.sub! 'IV', 'IIII'

  new_number = nvmber.split("")
  engnum = 0

  counts = Hash.new 0

  new_number.each do |char|
    counts[char] += 1
  end

  engnum = counts["M"] * 1000 + counts["D"] * 500 + counts["C"] * 100 +
  counts["L"] * 50 + counts["X"] * 10 + counts["V"] * 5 + counts["I"]
  puts "Here is your de-Romanized number: "
  puts engnum

end

puts "A. Would you like to make a regular number into a Roman Numeral?"
puts "B. Or would you like to make a Roman Numeral into a base-10 one?"
puts "Type 'A' or 'B' to pick an option, or 'QUIT' to leave the program"


while true
  input = gets.chomp.upcase
  if input == "A"
    puts "give me a number and I'll give it back in Roman Numerals (Using up to 4-digits)"
    number = gets.chomp.to_s.downcase
    if number.count("a-z") > 0
      puts "Please only input positive integers"
    else
      number = number.to_i
      romanizer (number)
    end

  elsif input == "B"
    puts "give me a Roman Numeral and I'll give it back in base-10"
    nvmber = gets.chomp.to_s.upcase
      if nvmber.count("A-B") > 0 || nvmber.count("E-H") > 0 ||
         nvmber.count("J-K") > 0 || nvmber.count("N-U") > 0 ||
         nvmber.include?("IM") || nvmber.include?("ID") || nvmber.include?("IC") ||
         nvmber.include?("IL") || nvmber.include?("VM") || nvmber.include?("VD") ||
         nvmber.include?("VC") || nvmber.include?("VL") || nvmber.include?("VX") ||
         nvmber.include?("VV") || nvmber.include?("XM") || nvmber.include?("XD")
         puts "Invalid numeral or character detected"
       else
         de_romanizer (nvmber)
       end
  elsif input == "QUIT"
    puts "Goodbye"
    break
  else
    puts "Please input either 'A', 'B', or 'QUIT'."
  end
  puts "Try again? 'A', 'B', or 'QUIT'"
end
