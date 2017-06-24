class Car
  @@makes = []
  @@cars = {}
  attr_reader :make
  def self.total_count
    @total_count ||= 0
  end
  def self.total_count=(n)
    @total_count = n
  end
  def self.add_make(make)
    unless @@makes.include?(make)
      @@makes << make
      @@cars[make] = 0
    end
  end
  def initialize(make)
    if @@makes.include?(make)
      puts "Creating a new #{make}."
      @make = make
      @@cars[make] += 1
      self.class.total_count += 1
    else
      raise "No such make #{make}."
    end
  end
  def make_mates
    @@cars[self.make]
  end
end

class Hybrid < Car
end

Car.add_make("Ford")
Car.add_make("Honda")


f1 = Car.new("Ford")
f2 = Car.new("Ford")
f3 = Hybrid.new("Ford")
h = Car.new("Honda")
hy = Hybrid.new("Honda")

p Car.total_count
p Hybrid.total_count
p f1.make_mates
