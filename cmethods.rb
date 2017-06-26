class Integer
  def my_times
    c = 0
    until c == self
      yield(c)
      c += 1
    end
    self
  end
end

class Array
  def my_each
    c = 0
    until c == size
      yield(self[c])
      c += 1
    end
    self
  end
  def my_map
    acc = []
    my_each {|e| acc << yield(e)}
    acc
  end
end

class Bid
  include Comparable
  attr_accessor :estimate
  def <=>(other_bid)
    self.estimate <=> other_bid.estimate 
  end
end


5.my_times {|i| puts "iteration #{i}"}
array = [1,4,3,4,7]
array.my_each {|e| puts "my_each was handed #{e}"}
array.my_map {|e| puts e * 10}
