class Dragon
  def initialize (name)
    @name = name
    @asleep = false
    @stuff_in_belly = 10
    @stuff_in_intestine = 0
    $counter = 1
  end

  def feed
    puts "you feed #{@name}"
    @stuff_in_belly = 10
    passage_of_time
  end

  def walk
    puts "you take #{@name} for a walk"
    @stuff_in_intestine = 0
    passage_of_time
  end

  def put_to_bed
    puts "you put #{@name} to bed"
    @asleep = true
    3.times do
      if @asleep
        passage_of_time
      end
      if @asleep
        puts "#{@name} snores, filling the room with smoke."
      end
    end
    if @asleep
      @asleep = false
      puts "#{@name} wakes up slowly"
    end
  end

  def toss
    puts "you toss #{@name} up into the air."
    puts "he giggles, which singes your eyebrows"
    passage_of_time
  end

  def rock
    puts "you rock #{@name} gently."
    @asleep = true
    puts "he briefly dozes off..."
    passage_of_time
    if @asleep
      @asleep = false
      puts "...but wakes when you stop."
    end
  end

  private

  def hungry?
    @stuff_in_belly<=2
  end

  def poopy?
    @stuff_in_intestine >= 8
  end

  def passage_of_time
    if @stuff_in_belly > 0
      @stuff_in_belly -= 1
      @stuff_in_intestine += 1
    else
      if @asleep
        @asleep = false
        puts "he wakes up suddenly"
      end
      puts "#{@name} is starving! in desperation, he ate you!"
      $counter = 0
      break
    end
    if @stuff_in_intestine >= 10
      @stuff_in_intestine = 0
      puts "whoops! #{@name} had an accident"
    end
    if hungry?
      if @alseep
        @asleep = false
        puts "he wakes up suddenly"
      end
      puts "#{@name}'s stomach growls'"
    end
    if poopy?
      if @asleep
        @asleep = false
        puts "he wakes up suddenly"
      end
      puts "#{@name} does the potty dance"
    end
  end
end


puts "would you like to adopt a dragon?"

x = true
while x == true
  response = gets.chomp.downcase
  if response == "yes"
    puts "what is the new dragon's name?"
    name = gets.chomp
    dra = Dragon.new name
    puts "Here is your new dragon"
    while $counter > 0
      puts "Would you like to 'feed', 'walk', 'toss', or 'put to bed'?"
      input = gets.chomp.downcase
      if input == "feed"
        dra.feed
      elsif input == "walk"
        dra.walk
      elsif input == "toss"
        dra.toss
      elsif input == "put to bed"
        dra.put_to_bed
      else
        puts "please use one of the four listed inputs"
      end
    end
  puts "come back from the dead to adopt another dragon?"
  elsif response == "no"
    x = false
  else
    puts "please answer yes or no"
  end
end
