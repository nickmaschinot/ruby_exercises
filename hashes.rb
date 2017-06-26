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


arr= Array.new(2,"a")
n = 0
arr2 = Array.new(4) { n += 1; n * 8 }
puts arr
puts arr2

hidden_num = Array.new(8,3)
hidden_num << 5
hidden_num.shuffle!
p hidden_num


def num_guess(array)
  message = "hidden number is in position"
  if array.sum_array(array[0..2]) == array.sum_array(array[3..5])
    if array[6] == array[7]
      p "#{message} 8"
    elsif array[6] > array[7]
      p "#{message} 6"
    else
      p "#{message} 7"
    end
  elsif array.sum_array(array[0..2]) < array.sum_array(array[3..5])
    if array[3] == array[4]
      p "#{message} 5"
    elsif array[3] > array[4]
      p "#{message} 3"
    else
      p "#{message} 4"
    end
  else
    if array[0] == array[1]
      p "#{message} 2"
    elsif array[0] > array[1]
      p "#{message} 0"
    else
      p "#{message} 1"
    end
  end
end

num_guess(hidden_num)
