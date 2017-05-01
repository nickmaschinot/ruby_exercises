
def leap_year start_year, end_year
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
end

while true
  puts "give me two years and I will list all leap years between them."
  puts "What is your starting year?"
  start_year = gets.chomp.downcase
  puts "what is your end year?"
  end_year = gets.chomp.downcase

  if start_year.count("a-z") > 0
    puts "Please only input positive integers"
  elsif end_year.count("a-z") > 0
    puts "Please only input positive integers"
  else
    start_year = start_year.to_i
    end_year = end_year.to_i
    leap_year start_year, end_year
  end

  puts "try again? or QUIT?"
  response = gets.chomp.upcase

  if response == "QUIT"
  puts "Goodbye"
  break
  end
end
