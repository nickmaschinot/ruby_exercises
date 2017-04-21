table_of_contents = [["Chapter 1: ", "Getting Started", "page 1"],
["Chapter 2: ", "Numbers", "page 9"],["Chapter 3: ", "Letters", "page 13"]]
line_width = 60

title = "Table of Contents"
puts title.center(line_width)
puts ""

table_of_contents.each do |chapter, title, page|
  puts chapter + title + page.rjust(line_width-(chapter.length + title.length))
end
