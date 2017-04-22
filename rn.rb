puts "give me a number and I'll give it back in Roman Numerals (Using up to 4-digits)"

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

    puts "Here is your new Roman Numeral"
    puts roman_numeral

end

number = gets.chomp.to_i

romanizer number


puts 9/2
