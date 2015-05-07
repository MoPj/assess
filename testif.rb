class Item
	class << self
	def show
		puts "Class method show"
end
end
end
Item.show
puts '5' if 5==5

class School
	@@SCHOOLS = [1,2,3]
	def initialize
		@@SCHOOLS << self 
	end
	def self.SCHOOLS
		@@SCHOOLS
	end
end
School.new
puts School.SCHOOLS[0]

class Item1
	def initialize(item_name)
		@item_name = item_name
	end
	def show
		puts "Instance method show invoked for '#{self}'"
	end
	def to_s
		"Item:#{@item_name}"
	end
end
Item1.new("silence").show

puts self
