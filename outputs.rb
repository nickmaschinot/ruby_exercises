record = File.open("temp.out", "w")
old_stdout = $stdout
$stdout = record
$stderr = $stdout
f = File.new("c2fout.rb")
puts "This is a record"
3.times do
  puts f.gets
end
f.rewind
p f.readlines
f.rewind
f.each {|line| puts "Next line: #{line}" }
f.rewind
p f.pos
f.pos = 10
#f.seek(15, IO::SEEK_CUR)
p f.gets
p f.pos
z = 10/0
