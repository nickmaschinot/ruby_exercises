
array = [1, "Unk", "unk", "Max", "ri", "Chester", 7]

array = array.map!(&:to_s)
array = array.map!(&:downcase)
array = array.sort



puts array
