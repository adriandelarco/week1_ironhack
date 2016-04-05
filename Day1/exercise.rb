class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

@homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Juanjo's place", "San Juan", 2, 42),
  Home.new("Alberto's place", "Madrid", 1, 30),
  Home.new("Tyler's place", "Los Ángeles", 6, 65),
  Home.new("Satoshi's place", "Tokyo", 12, 90),
  Home.new("Jorge's place", "Buenos Aires", 3, 18)
]

def print_homes (homes)
	homes.each do |hm|
 		 puts "---------\n#{hm.name} in #{hm.city}\nPrice: #{hm.price}$/night - Capacity: #{hm.capacity} persons"
	end
end

def sort_by_price (homes, order=1)

	sorted_homes = homes.sort do |a, b|
		if order == 1
			a.price <=> b.price
		else
			b.price <=> a.price		
		end

	end
	sorted_homes
end

def sort_by_capacity (homes, order=1)

	sorted_homes = homes.sort do |a, b|
		if order == 1
			a.capacity <=> b.capacity
		else
			b.capacity <=> a.capacity		
		end

	end
	sorted_homes
end

def ask_for_order()

	puts "How do you want to sort the homes? Type \"price\" or \"capacity\""  
	STDOUT.flush  
	order_type = gets.chomp

	if order_type == "price"

		puts "Ascending or descending price? Type \"ascending\" or \"descending\""  
		STDOUT.flush  
		order_type = gets.chomp

		while (order_type != "ascending" && order_type != "descending") do
			puts "You didn't type it correctly.Type \"ascending\" or \"descending\""
			order_type = gets.chomp
		end

		if order_type == "ascending"
			print_homes (sort_by_price(@homes,1)) 
		elsif order_type == "descending"
			print_homes (sort_by_price(@homes,2)) 
		end

	elsif order_type == "capacity"

		puts "Ascending or descending capacity? Type \"ascending\" or \"descending\""  
		STDOUT.flush  
		order_type = gets.chomp

		while (order_type != "ascending" && order_type != "descending") do
			puts "You didn't type it correctly. Type \"ascending\" or \"descending\""
			order_type = gets.chomp
		end

		if order_type == "ascending"
			print_homes (sort_by_capacity(@homes,1)) 
		elsif order_type == "descending"
			print_homes (sort_by_capacity(@homes,2)) 
		end
	else
		puts "You didn't type it correctly. "
		ask_for_order()
	end

end
ask_for_order()
def filter_homes()

	puts "In which city are you looking for?"  
	STDOUT.flush  
	city_to_filter = gets.chomp.downcase

	filtered_homes = @homes.select do |hm|
		hm.city.downcase == city_to_filter
	end

	if filtered_homes.empty? == true
		puts "Sorry, there is no available houses in this city."
	else
		print_homes (filtered_homes) 
	end
end



def average_price(array)

	total_price = 0

	array.each do |id|
		total_price += @homes[id].price
	end

	puts (total_price/array.size)

end



def find_price()

	puts "Which price are you looking for?"  
	STDOUT.flush  
	price = Integer(gets.chomp)

	house_with_price = @homes.select do |hm|
		hm.price == price
	end

	if house_with_price.empty? == true
		puts "Sorry, there is no available houses with that price."
	else
		print_homes (house_with_price) 
	end
end

