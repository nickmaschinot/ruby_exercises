puts "What is your starting year?"
start_year = gets.chomp.to_i
puts "what is your end year?"
end_year = gets.chomp.to_i


while start_year <= end_year
   if start_year % 400 == 0
      puts start_year
    elsif start_year % 100 == 0
      print ""
    elsif start_year % 4 == 0
      puts start_year
   end
   start_year += 1
end
