require "colorize"

class Car

	def initialize(engine, sound)
		@engine = engine
		@sound = sound
	end

	def noise
		puts @sound
		@engine.noise
	end
end

class Engine
	def noise
		puts "Broom Broom!".red
	end
end

class Vehicle
	attr_reader(:wheels, :noise)
	def initialize(wheels, noise)
		@wheels = wheels
		@noise = noise
	end
	def noise
		puts @noise
	end
end

class Number_wheels

	def initialize(array)
		@array = array
	end

	def count
=begin
		@array.reduce(0) do |sum, vehicle|
			sum + vehicle.wheels
		end
		puts sum
=end
		sum = 0
		@array.each do |vehicle|
			sum += vehicle.wheels
		end
		puts sum

	end
	
end

class Make_sound

	def initialize(array)
		@array = array
	end


def noise
		@array.each do |vehicle|
			puts vehicle.noise
		end
end

end


Fiat_panda_engine = Engine.new
Camaro_engine = Engine.new
Camaro = Car.new(Camaro_engine, "Broooooooooom!".yellow)
Fiat_panda = Car.new(Fiat_panda_engine, "Brom".blue)

Vehicle1 = Vehicle.new(4, "jiji")
Vehicle2 = Vehicle.new(5, "jeje")
Vehicle1.noise

array = [Vehicle1, Vehicle2]
Wheels_1_2 = Number_wheels.new(array)
Wheels_1_2.count

Noise_1_2 = Make_sound.new(array)
Noise_1_2.noise