

hash = {
  "Christopher Alexander" => "Oct 4, 1936",
  "Christopher Lambert"   => "Mar 29, 1957",
  "Christopher Lee"       => "May 27, 1922",
  "Christopher Lloyd"     => "Oct 22, 1938",
  "Christopher Pine"      => "Aug 3, 1976",
  "Christopher Plummer"   => "Dec 13, 1927",
  "Christopher Walken"    => "Mar 31, 1938",
  "Lili"                  => "Jul 3, 1992",
  "Nick"                  => "Dec 9, 1988"
}


months = ["", "jan", "feb", "mar", "apr", "may", "jun", "jul",
          "aug", "sept", "oct", "nov", "dec"]




def b_day_search(hash, key)
  months = ["", "jan", "feb", "mar", "apr", "may", "jun", "jul",
            "aug", "sept", "oct", "nov", "dec"]

    puts "Name: #{key}"
    puts "DOB: #{hash[key]}"
    b_day = hash[key]
    b_day = b_day.downcase
    b_day = b_day.split(/\W+/)

    mon = months.index("#{b_day[0]}")
    day = b_day[1].to_i
    year = b_day[2].to_i
    mon = mon.to_i

    dob = Time.local(year, mon, day)
    present = Time.new
    present = present.to_s
    present = present.split(/\W+/)

    pyear = present[0].to_i
    pmon = present[1].to_i
    pday = present[2].to_i

    age_day = pday - day
    age_mon = pmon - mon

    if age_day < 0
      age_mon -= 1
      age_day = 31 + age_day
    end

    age_year = pyear - year

    if age_mon < 0
      age_year -= 1
      age_mon = 12 + age_mon
    end

    b_day_year = year + age_year + 1

    next_b_day = "#{mon}/#{day}/#{b_day_year}"
    how_old = "This person is #{age_year}-years, #{age_mon}-months, and #{age_day}-days old."
    puts how_old
    puts "Their next birthday is on #{next_b_day}"

    puts ""
end

puts "Please input a name from the database, or type QUIT"

while true
  name = gets.chomp
  puts ""
  if hash.key?(name)
    puts "Information found:"
    b_day_search (hash, name)
  elsif name == "QUIT"
    puts "Goodbye"
    break
  else
    puts "Person not found. Please input a name from the database, or type QUIT"
  end
  puts "Search again? or QUIT?"
end
