class Person
  PEOPLE = []
  attr_reader :name, :hobbies, :friends
  attr_accessor :first_name, :middle_name, :last_name
  def initialize
    @whole_name = ""
    @hobbies    = []
    @friends    = []
    PEOPLE << self
  end
  def has_hobby(hobby)
    @hobbies << hobby
  end
  def has_friend(friend)
    @friends << friend
  end
  def self.method_missing(m, *args)
    if m.to_s.start_with?("all_with_")
      attr = m[9..-1]
      if self.public_method_defined?(attr)
        PEOPLE.find_all do |person|
          person.send(attr).include?(args[0])
        end
      else
        raise ArgumentError, "Cant find #{attr}"
      end
    else
      super
    end
  end
end


j = Person.new("John")
p = Person.new("Paul")
g = Person.new("George")
r = Person.new("Ringo")
j.has_friend(p)
j.has_friend(g)
g.has_friend(p)
r.has_hobby("drumming")

Person.all_with_friends(p).each do |person|
  puts "#{person.name} is friends with #{p.name}"
end
Person.all_with_hobbies("drumming").each do |person|
  puts "#{person.name} is into drumming"
end
Person.all_with_children
