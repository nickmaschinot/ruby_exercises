words = ["unk", "boo", "ri", "chester", "max"]

def dictionary_sort array
  return array if array.length <= 1

  middle = array.pop
  less = array.select{ |x| x.downcase < middle.downcase}
  more = array.select{ |x| x.downcase >= middle.downcase}

  dictionary_sort(less) + [middle] + dictionary_sort(more)
end

puts(dictionary_sort(words).join(" "))
