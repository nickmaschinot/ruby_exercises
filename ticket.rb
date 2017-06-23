ticket = Object.new

def date
  "01/02/03"
end
def venue
  "Town Hall"
end
def event
  "Author's Reading"
end
def performer
  "Mark Twain"
end
def seat
  "Second Balcony, row 3, seat 12"
end
def price
  5.50
end

print "This ticket is for: "
print event + ", at "
print venue + ", on "
puts date + "."
print "The performer is "
puts performer + "."
print "Your seat is "
print seat + ", "
print "and it costs $"
puts "%.2f." % price + "."
