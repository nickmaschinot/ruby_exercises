
def english_number (number)
  ones_place = ["", "one ", "two ", "three ", "four ", "five ",
                "six ", "seven ", "eight ", "nine "]
  teens = ["", "eleven ", "twelve", "thirteen ", "fourteen ", "fifteen ", "sixteen ",
           "seventeen ", "eighteen ", "nineteen "]
  tens_place = ["", "ten ", "twenty ", "thirty ", "forty ", "fifty ", "sixty ", "seventy ",
                "eighty ", "ninety "]
  higher_place = ["", "hundred ", "thousand ", "million ", "billion ", "trillion "]

  sign = ""

  if number < 0
    sign = "negative-"
  elsif number == 0
    puts "zero"
  end

  number = number.abs

  ttrig = 0; thrig = 0; btrig = 0; bhrig = 0; mtrig = 0; mhrig = 0; dtrig = 0
  dhrig = 0; htrig = 0

  t = number/1000000000000
    if t >= 1
      ttrig = 5
      if t >= 100
        thrig = 1
      end
    end
  number = number - t * 1000000000000
    tn = t; th = tn/100; tn = tn - th * 100; tt = tn/10; tn = tn - tt * 10

  b = number/1000000000
    if b >= 1
      btrig = 4
      if b >= 100
        bhrig = 1
      end
    end
  number = number - b * 1000000000
    bn = b; bh = bn/100; bn = bn - bh * 100; bt = bn/10; bn = bn - bt * 10

  m = number/1000000
    if m >= 1
      mtrig = 3
      if m >= 100
        mhrig = 1
      end
    end
  number = number - m * 1000000
    mn = m; mh = mn/100; mn = mn - mh * 100; mt = mn/10; mn = mn - mt * 10

  d = number/1000
    if d >= 1
      dtrig = 2
      if d >= 100
        dhrig = 1
      end
    end
  number = number - d * 1000
    dn = d; dh = dn/100; dn = dn - dh * 100; dt = dn/10; dn = dn - dt * 10

  h = number/100
    if h >= 1
      htrig = 1
    end
  number = number - h * 100
  x = number/10
  number = number - x * 10
  n = number

  answer = sign + ones_place[th] + higher_place[thrig] + tens_place[tt] + ones_place[tn] +
  higher_place[ttrig] + ones_place[bh] + higher_place[bhrig] + tens_place[bt] +
  ones_place[bn] + higher_place[btrig] + ones_place[mh] + higher_place[mhrig] +
  tens_place[mt] + ones_place [mn] + higher_place[mtrig] + ones_place[dh] +
  higher_place[dhrig] + tens_place[dt] + ones_place [dn] + higher_place[dtrig] +
  ones_place[h] + higher_place[htrig] + tens_place[x] + ones_place[n]

    answer.gsub! "ten nine", "nineteen"; answer.gsub! "ten eight", "eighteen"
    answer.gsub! "ten seven", "seventeen"; answer.gsub! "ten six", "sixteen"
    answer.gsub! "ten five", "fifteen"; answer.gsub! "ten four", "fourteen"
    answer.gsub! "ten three", "thirteen"; answer.gsub! "ten two", "twelve"
    answer.gsub! "ten one", "eleven"; answer.gsub! " ", "-"
    answer = answer.chop

  puts "Here is your number:"
  puts answer

end

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
    english_number (number)
  end
  puts "try again? or QUIT?"
end
