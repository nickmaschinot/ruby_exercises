class Rainbow
  include Enumerable
  def each
    yield "red"
    yield "orange"
    yield "yellow"
    yield "green"
    yield "blue"
    yield "indigo"
    yield "violet"
  end
end
r = Rainbow.new
r.each do |color|
  p "Next color: #{color}"
end
y_color = r.find {|color| color.start_with?('y')}
p "first color that starts with 'y' is #{y_color}"
p Enumerable.instance_methods(false).sort
p r.include?("red")
p r.include?("pink")
p r.all? {|color| color =~ / /}
p r.any? {|color| color =~ /v/}
p r.one? {|color| color =~ /y/}
p r.one? {|color| color =~ /i/}
p r.none? {|color| color =~ /z/}

class Die
  include Enumerable
  def each
    5.times do
      yield rand(6) + 1
    end
  end
end

dice = Die.new
dice.each do |roll|
  p "you rolled a #{roll}"
  if roll == 6
    p "you win!!!"
    break
  end
end

state_hash = {
  "New York" => ["NY", 19.7, "Albany"],
  "California" => ["CA", 39.5, "Sacramento"],
  "Texas" => ["TX", 27.9, "Austin"],
  "Florida" => ["FL", 20.6, "Tallahassee"],
  "Illinois" => ["IL", 12.6, "Springfield"],
}
p state_hash["New York"][2]
p state_hash.values_at("Texas", "New York")
p state_hash
p state_hash.select {|k,v| k > "G"}
p state_hash.reject {|k,v| k > "G"}
