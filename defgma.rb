
bye=0

while bye < 3
puts "Say hi to grandma "
response = gets.chomp

  if response == "BYE"
      bye+=1
      if bye < 3
        puts "I did not hear anything "
      end
    elsif response == response.upcase
      year = rand(1930...1950)
      puts "NO, NOT SINCE #{year} "
        bye = 0
    else
      puts "Huh? speak louder "
        bye = 0
  end

  if bye == 3
    puts "Oh well, if you have to leave "
  end

end
