class Car
	@@total_car_count = 0
	@@cars_per_color = Hash.new

	# "self." means that the method belongs to the class instead of the instance.

	def self.total_car_count
		@@total_car_count
	end

	def self.cars_per_color
		@@cars_per_color
	end

	def self.most_popular_color
		@@cars_per_color.max_by {|color, amount| amount}[0]
	end

	def to_s()
		"I'm a car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	attr_accessor :roof_status
	def initialize(color)
		@@total_car_count += 1
		@color = color
		
		if @@cars_per_color.include?(color)
			@@cars_per_color[color] += 1
		else
			@@cars_per_color[color] = 1
		end
		@fuel = 10
		@distance = 0
	end
	
	def color= (new_color)
		@@cars_per_color[@color] -= 1
		@color = new_color
		if @@cars_per_color.include?(new_color)
			@@cars_per_color[new_color] += 1
		else
			@@cars_per_color[new_color] = 1
		end
	end


	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end
end

class ConvertibleCar < Car
	attr_accessor :roof_status
	def initialize(color, convertible= false)
		super(color)
		@convertible = convertible
		if @convertible
			@roof_status ='closed'
		end
	end

	def top_down
		if @convertible
			@roof_status = "open"
		end
		puts "The roof is #{@roof_status}."
	end

	def close_top
		if @convertible
			@roof_status = "closed"
		end
		puts "The roof is #{@roof_status}."
	end

end

camaro = Car.new('white')
beetle = Car.new('red')
a = Car.new('black')
b = Car.new('black')
c = Car.new('green')
d = Car.new('black')
e = Car.new('red')
best_color = Car.most_popular_color
Car.new(best_color)

=begin
	
Note that you have to be very careful with where you use class variables and class methods. The general rules to follow are:

Class methods are used only on the class
Instance methods are used only on instances
Instance variables can be accessed only in instance methods
Class variables can be accessed anywhere

=end

