
require 'HTTParty'
require 'JSON'
require 'Pry'
require 'csv'
require 'Nokogiri'

page = HTTParty.get('https://www.si.com/nba/schedule')

parse_page = Nokogiri::HTML(page)

team_names = []

parse_page.css(".numeric-score").css(".team-abbreviation").map do |a|
  team_name = a.text
  team_names.push(team_name)
end
team_names.each do |a|
   a.gsub! "\n", ""
end

n = team_names.count
while n > -1
  if n % 2 == 0
    team_names.delete_at(n)
    n -= 1
  else
    n -= 1
  end
end
p team_names
n = 0
while n < team_names.count
  if n % 3 == 0
    team_names.insert(n, "--------------------")
    n += 2
  else
    n += 1
  end
end

p team_names[0]

team_names.each do |a|
  p a
end
