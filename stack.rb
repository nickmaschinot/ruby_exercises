require_relative "stacklike"
class Stack
  include Stacklike
end

s = Stack.new
s.add_to_stack("item one")
s.add_to_stack("item two")
s.add_to_stack("item three")
puts "Objects currently in the stack: #{s.stack}"
taken = s.take_from_stack
puts "Removed #{taken}"
puts "Now on the stack #{s.stack}"
