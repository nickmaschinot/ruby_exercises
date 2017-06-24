class Bicycle
  attr_reader :wheels, :gears, :seats
  def initialize(gears)
    @wheels = 2
    @seats = 1
    @gears = gears
  end
end

class Tandem < Bicycle
  def initialize(gears)
    super
    @seats = 2
  end
end

tan = Tandem.new(5)
puts tan.gears
puts tan.seats
