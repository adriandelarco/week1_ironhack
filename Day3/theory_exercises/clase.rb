=begin  FIRST EXERCISE
#----------------------------------------------

@arra = [
{:lat => 25, :lng => 80, :name => "Miami"},
{:lat => 48, :lng => 2, :name => "Paris"},
{:lat => 40, :lng => 3, :name => "Madrid"},
{:lat => 18, :lng => 66, :name => "San Juan"}
]

def coord

	@arra.each do |city|

		puts "Lat: #{city[:lat]} Lng: #{city[:lng]}"

	end

end

#----------------------------------------------
=end

=begin  SECOND EXERCISE
#----------------------------------------------

lemonade_revenue = {
	:monday => { :revenue => 20, :costs => 5, :feedback => ["Good", "Too sweet"]},
	:tuesday => { :revenue=> 15, :costs => 4, :feedback => ["Meh"]},
	:wednesday => { :revenue=> 5, :costs => 3, :feedback => ["Wow"]},
	:thursday => { :revenue=> 9, :costs => 3, :feedback => ["Best", "Not sweet"]},
	:friday => { :revenue => 14, :costs => 4, :feedback => []},
}

puts lemonade_revenue[:thursday][:feedback]
puts lemonade_revenue[:tuesday][:revenue] - lemonade_revenue[:tuesday][:costs]


#----------------------------------------------
=end


=begin  THIRD EXERCISE
#----------------------------------------------

lemonade_revenue = {
	:monday => { :revenue => 20, :costs => 5, :feedback => ["Good", "Too sweet"]},
	:tuesday => { :revenue=> 15, :costs => 4, :feedback => ["Meh"]},
	:wednesday => { :revenue=> 5, :costs => 3, :feedback => ["Wow"]},
	:thursday => { :revenue=> 9, :costs => 3, :feedback => ["Best", "Not sweet"]},
	:friday => { :revenue => 14, :costs => 4, :feedback => []},
}

hash = {:wat => ["A", "B", {:wut => ["A", [[1,2,3,4,5,6,7,8,9,{:bbq => "Yes"}], "2"]]}]}
puts hash[:wat][2][:wut][1][0][9][:bbq]

arr = [[1,2,3,4,5,{:secret => {:unlock => [0,"Yes"]}}]]
puts arr[0][5][:secret][:unlock][1]

#----------------------------------------------
=end


#begin  THIRD EXERCISE
#----------------------------------------------


require "colorize"
require 'pry'

class CarDealer

	def initialize(inventory_hash)	

		@cars = inventory_hash

	end

	def getcars(brand)

		puts "#{brand}: #{@cars[brand.to_sym].join(", ")}".red

	end

	def askforbrand

		brand = gets.chomp

		if !@cars.key?(brand.to_sym)
			puts "It doesn't exist."
		else
			puts "#{brand}: #{@cars[brand.to_sym].join(", ")}".red
		end

	end

	def inventory

		@cars.each do |brand_key, car_block|

			puts "#{brand_key}: #{car_block.join(", ")}.".blue

		end

	end

end

inventory_hash = { 
			:Ford => ["Fiesta", "K"],
			:Renault => ["21", "Megane"],
			:BMW => ["Serie 3", "Serie 1"]
		}

cardealers = CarDealer.new(inventory_hash)


cardealers.getcars("Ford")
cardealers.inventory
cardealers.askforbrand

#----------------------------------------------
#end