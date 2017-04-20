
bye=0

while bye < 3
print "Say hi to grandma "
response = gets.chomp
if response == "BYE"
  bye+=1
   if bye < 3
     print "I did not hear anything "
   end
elsif response == response.upcase
  year = 1950 - rand * 20
  print "NO, NOT SINCE #{year} "
    if bye > 0
      bye -= 1
    end
else
  print "Huh? speak louder "
    if bye > 0
      bye -= 1
    end
end

  if bye == 3
    print "Oh well, if you have to leave "
  end

end
