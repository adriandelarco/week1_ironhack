require "colorize"
require "date"

class ShoppingCart

	def initialize (shop)
		@shop = shop
		@array_of_items = []
		@hash_items = {}
		@array_of_printed_items = []
	end
	
	def add_item_to_cart(item)
		@array_of_items.push(@shop.hash_items[item])
	end

	def pay
		cost
		show
	end

	def cost
		puts "\n"
		sum = 0
		@array_of_items.each do |item|
			sum += item[1].to_i
		end
		calculate_discounts
		@@final_cost = (sum - @@total_discount)
	end

	def show
		puts "\nSHOPPING LIST".blue
		puts "-----------------------"
		@array_of_items.each do |active_item|
			n_repeated_item = count_repeated_items(active_item)
			if !@array_of_printed_items.include?(active_item)
				puts "#{n_repeated_item} - #{active_item[0]} -  #{active_item[1]}$"
				@array_of_printed_items.push(active_item)
			end
		end
	    if $free_banana == true 
	    	puts "-----------------------"
	    	puts "X - Gift free banana -#{@shop.hash_items[:banana][1]}$".green
	    	puts "X - Discounts: -#{@@total_discount}$".green
	    end
		puts "-----------------------"
		puts "The total price is: #{(@@final_cost)}$".red
	end

	def count_repeated_items(active_item)

		sum = 0
		@array_of_items.each do |item|
			if active_item == item
				sum += 1
			end
		end
		sum

	end

	def do_something(action)
	    action = action.to_sym
	    if respond_to?(action)
	      send(action)
	    end
	end

	def gift(number_free_items, item_for_free)

		puts "Do you want one banana for free? :)".green
		answer = gets.chomp
		if answer == "yes"
			add_item_to_cart item_for_free
			puts "Free banana added to your cart.".green
			$free_banana = true
		end

	end

	def free(units_to_get_discounts, units_for_free, active_item, name)

		n_repeated_item = count_repeated_items(active_item)
		discount_times = n_repeated_item/units_to_get_discounts
		discount = active_item[1]*discount_times*units_for_free
		@@total_discount += discount
		if discount > 0
		puts "You got a discount of #{discount}$. Because you bought #{n_repeated_item} #{name.downcase}s.".yellow
		end
	end

	def calculate_discounts

		@@total_discount = 0
		@array_of_items_uniq = @array_of_items.uniq
		@array_of_items_uniq.each do |active_item|

			@shop.array_of_discounts.each do |discount|

				if discount[0] == active_item[0]
					case discount[2][0]
					 when "gift"
					 	gift(discount[2][1],discount[2][2])
					 when "free"
					 	free(discount[1],discount[2][1],active_item,discount[0])
					 end 
				end
			end
		end

		@@total_discount

	end

end

class Shop
	attr_reader :hash_items, :array_of_discounts

	def initialize
		@hash_items = {}
		@array_of_discounts = []
	end

	def add_item_to_shop(key,name,price)
		@hash_items[key] = [name, price]
	end

	def calculate_price

		season = Date.new.season

		case season
		when :spring
			@hash_items[:apple][1] = 10
			@hash_items[:orange][1] = 5
			@hash_items[:grape][1] = 15
			@hash_items[:banana][1] = 20
		when :summer
			@hash_items[:apple][1] = 10
			@hash_items[:orange][1] = 2
			@hash_items[:grape][1] = 15
			@hash_items[:banana][1] = 20
		when :autumn
			@hash_items[:apple][1] = 15
			@hash_items[:orange][1] = 5
			@hash_items[:grape][1] = 15
			@hash_items[:banana][1] = 20
		when :spring
			@hash_items[:apple][1] = 12
			@hash_items[:orange][1] = 5
			@hash_items[:grape][1] = 15
			@hash_items[:banana][1] = 21
		end

		w_day = Date.new.day
		if w_day == 7
				@hash_items[:watermelon][1] = 5
		end

	end

	def add_discount_to_shop(name,units_to_get_discounts,type)
		@array_of_discounts.push ([name, units_to_get_discounts, type])
	end
	
end

class Date

	def season
	  year_day = Date.today.yday().to_i

	  #Calcular bisiesto
	  year = Date.today.year.to_i
	  is_leap_year = year % 4 == 0 && year % 100 != 0 || year % 400 == 0
	  if is_leap_year and year_day > 60
	    year_day = year_day - 1
	  end

	  if year_day >= 355 or year_day < 81
	    result = :winter
	  elsif year_day >= 81 and year_day < 173
	    result = :spring
	  elsif year_day >= 173 and year_day < 266
	    result = :summer
	  elsif year_day >= 266 and year_day < 355
	   result = :autumn
	  end
	  result
	end

	def day
		w_day = Date.today.wday
	end

end

shop_fruits = Shop.new
shop_fruits.add_item_to_shop(:apple,"Apple",10)
shop_fruits.add_item_to_shop(:orange,"Orange",5)
shop_fruits.add_item_to_shop(:grape,"Grape",15)
shop_fruits.add_item_to_shop(:banana,"Banana",20)
shop_fruits.add_item_to_shop(:watermelon,"Watermelon",50)
shop_fruits.add_discount_to_shop("Banana", 2, ["free", 1])
shop_fruits.add_discount_to_shop("Grape", 4, ["gift", 1, :banana])
shop_fruits.add_discount_to_shop("Orange", 3, ["free", 2])
cart = ShoppingCart.new(shop_fruits)

cart.add_item_to_cart :apple
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape

shop_fruits.calculate_price
cart.pay