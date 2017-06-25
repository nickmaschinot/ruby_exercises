
class Event
  attr_accessor :performer
end

class Ticket < Event
  VENUES = ["Convention Center", "Fairgrounds", "Town Hall"]
  attr_reader :venue, :date
  attr_accessor :price
  def initialize(venue, date)
    if VENUES.include?(venue)
      @venue = venue
    else
      raise ArgumentError, "Unknown venue #{venue}"
    end
    @date = date
  end
  def ===(other_ticket)
    self.venue == other_ticket.venue
  end
end

def Ticket.most_expensive(*tickets)
  tickets.max_by(&:price)
end

th = Ticket.new("Town Hall", "11/13/14")
cc = Ticket.new("Convention Center", "12/13/14")
fg = Ticket.new("Town Hall", "12/13/14")


th.price = 63.00
cc.price = 45.25
fg.price = 100.00
highest = Ticket.most_expensive(th,cc,fg)
puts "The most expensive ticket is for #{highest.venue}."

th.performer = "The Boss"

puts "First ticket is for a #{th.venue} event on #{th.date}, and it costs
      $#{"%.2f" % th.price}. #{th.performer} will be performing."
th.price = (72.50)
puts "Oops, it just went up and now costs $#{"%.2f" % th.price}."
puts "The second ticket is for a #{cc.venue} event on #{cc.date}."

puts Ticket::VENUES

case th
when cc
  puts "same venue as 2"
when fg
  puts "same venue as 3"
else
  p "no match"
end
