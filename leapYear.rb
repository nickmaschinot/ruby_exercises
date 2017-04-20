puts "What is your starting year?"
start_year = gets.chomp
start_year = start_year.to_i
puts "what is your end year?"
end_year = gets.chomp
end_year = end_year.to_i

while start_year <= end_year
   if start_year % 400 == 0
      puts start_year
    elsif start_year % 100 == 0
      print ""
    elsif start_year % 4 == 0
      puts start_year
    else
      print ""
   end
   start_year += 1
end
