puts "give me a number and I will give it back in Roman Numerals (Using up to 4-digits)"

def romanizer number
  m = number/1000.to_i
  number = number - m * 1000
  d = number/500.to_i
  number = number - d * 500
  c = number/100.to_i
  number = number - c * 100
  l = number/50.to_i
  number = number - l * 50
  x = number/10.to_i
  number = number - x * 10
  v = number/5.to_i
  number = number - v * 5
  i = number.to_i

    roman_numeral = "M" * m + "D" * d + "C" * c + "L" * l + "X" * x + "V" * v + "I" * i
    roman_numeral.sub! 'DCCCC', 'CM'
    roman_numeral.sub! 'CCCC', 'CD'
    roman_numeral.sub! 'CXXXX', 'XC'
    roman_numeral.sub! 'XXXX', 'XL'
    roman_numeral.sub! 'VIIII', 'IX'
    roman_numeral.sub! 'IIII', 'IV'
    puts roman_numeral

end

number = gets.chomp.to_i

romanizer number
