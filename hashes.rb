require_relative "english_number"

hash = {
  red: "ruby",
  white: "diamond",
  green: "emerald"
}

hash.each.with_index {|(key,value), i|
  puts "Pair #{i} is: #{key}/#{value}"
}

module ArraySup
  def sum_array(array)
    @sum = 0
    array.each { |a| @sum+=a }
    @sum
  end
end

class Array
  include ArraySup
end
class Integer
  include EngNum
end

arr= Array.new(2,"a")
n = 0
arr2 = Array.new(4) { n += 1; n * 8 }
puts arr
puts arr2
p arr2.sum_array(arr2)
p arr.size
hidden_num = Array.new(8,3)
hidden_num << 5
hidden_num.shuffle!
p hidden_num


#only works with the classic two guesses to find one heavy ball out of nine puzzle
def num_guess(array)
  message = "hidden number is in position"
  i = 0
  if array.sum_array(array[0..2]) == array.sum_array(array[3..5])
    if array[6] == array[7]; i = 8
    elsif array[6] > array[7]; i = 6; else; i = 7
    end
  elsif array.sum_array(array[0..2]) < array.sum_array(array[3..5])
    if array[3] == array[4]; i = 5
    elsif array[3] > array[4]; i = 3; else i = 4
    end
  else
    if array[0] == array[1]; i = 2
    elsif array[0] < array[1]; i = 1
    end
  end
  p "#{message} #{i.english_number(i)}"
end

num_guess(hidden_num)
