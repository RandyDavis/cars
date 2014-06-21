class Car
	@@total_car_count = 0

	# "self." means that the method belongs to the class instead of the instance.

	def self.total_car_count
		@@total_car_count
	end

	def to_s()
		"I'm a car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	def initialize()
		@fuel = 10
		@distance = 0
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

# 1 - Class method on instance
#c = Car.new
#c.total_car_count

# 2 - Class method on class
#Car.total_car_count

# 3 - Instance method on class
#Car.drive(10)

# 4 - Instance method on instance
c = Car.new
c.drive(10)


=begin
	
Note that you have to be very careful with where you use class variables and class methods. The general rules to follow are:

Class methods are used only on the class
Instance methods are used only on instances
Instance variables can be accessed only in instance methods
Class variables can be accessed anywhere

=end

=begin
puts Car.total_car_count
c1 = Car.new
puts Car.total_car_count
c2 = Car.new
puts Car.total_car_count
=end

=begin
car_a = Car.new()
car_b = Car.new()
puts car_a
puts car_b
car_a.drive(10)
puts car_a
puts car_b
car_a.drive(232)
car_b.drive(117)
puts car_a
puts car_b
=end
