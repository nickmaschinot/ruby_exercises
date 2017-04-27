
def how_long_til(year, month, day, hour, minute, second, til)
  start = Time.local(year, month, day, hour, minute, second)
  onebil = start + til
end

def happy_birthday(year, month, day)
  b_day = Time.local(year, month, day)
  today = Time.now
  while today - b_day > 0
    puts "You had a birthday on #{b_day}"
    b_day += 31558000
  end
end

happy_birthday(1992, 7, 3)
