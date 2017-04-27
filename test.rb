
new_number = ["x", "x", "y", "x"]

counts = Hash.new 0

new_number.each do |char|
  counts[char] += 1
end

puts counts
puts counts["x"]
