f = File.new("data.out", "w")
f.puts "Nick Maschinot"
f.close
p File.read("data.out")

File.open("records.txt") do |f|
  while record = f.gets
    name, nationality, instrument, dates = record.chomp.split('|')
    puts "#{name} (#{dates}), who was #{nationality}, played the #{instrument}."
  end
end

p File.size("records.txt")
p FileTest.size("records.txt")
p File::Stat.new("records.txt").size 
