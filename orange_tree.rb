class OrangeTree
  def initialize (name)
    @name = name
    @height = 1
    @width = 1
    @oranges = 0
    @health = 100
    @age = 0
    @sick = 0
  end

  def water
    puts "you water #{@name}"
    @health += 10
    one_year_passes
  end

  def count_the_oranges
    if @oranges == 0
      puts "no oranges to see this year :("
    else
      puts "there are #{@oranges} this year"
    end
    one_year_passes
  end

  def eat_an_orange
    puts "Mmmmmm delicious"
    @oranges -= 1
    puts "There are #{@oranges} left"
  end

  def measure_tree
    puts "The tree is #{@height}ft tall"
    puts "and #{@width}ft wide now"
    one_year_passes
  end



  def one_year_passes
    @health -= 5
    @age += 1
    @health_factor = @health - @age

    if @sick == 1 && rand(1..100) < 30
      puts "#{@name} is dead!"
      counter = 0
      return
    elsif @sick == 1 && rand(1..100) > 30
      puts "#{@name} has recovered from it's illness!"
      @sick = 0
    end

    if @health - @age < 1
      puts "#{@name} died suddenly :("
      counter = 0
      return
    elsif rand(1..@health_factor) == 1
      puts "It looks like #{@name} is sick"
      @sick = 1
    end

    if @age < 6
      @oranges = 0
    elsif 6 <= @age && @age < 35
      @oranges = 6 * (@age - 5)
    elsif @age >= 35
      @oranges = 180 - (@age - 34) * 2
      if @oranges < 0
        @oranges = 0
      end
    end



    @height += (@age * (4/@age))

    @width += (@age * (3/@age))

    puts "#{@name} is now #{@age} years old."

  end
end


counter = 1

ot = OrangeTree.new "Charlie"
puts "Here is your new orange tree"
  while counter > 0
    puts "Would you like to 'water', 'measure', 'count oranges', or 'eat an orange'?"
    input = gets.chomp.downcase
    if input == "water"
      ot.water
    elsif input == "measure"
      ot.measure_tree
    elsif input == "count oranges"
      ot.count_the_oranges
    elsif input == "eat an orange"
      ot.eat_an_orange
    else
      puts "please use one of the four listed inputs"
    end
  end
