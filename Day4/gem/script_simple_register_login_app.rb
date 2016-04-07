class Counter

	def initialize

	end

	def start
		Register.new.register
	end

	def ask_Text

		puts "Insert a text."
		@text = gets.chomp
		count

    end

	def count

		puts "The number of characters is #{@text.size}"

	end

end

class Login

	def initialize (username, password, user_username)

		@username = username
		@password = password
		@user_username = user_username

	end

	def login

		puts "Insert your username"
		user = gets.chomp
		puts "Insert your password"
		pass = gets.chomp

		if user == @username && pass == @password

			puts "Correct login."

			counter_username = "counter_" + @username
			counter_username = Counter.new
			counter_username.ask_Text

		else

			puts "The username or password is not correct."
			login

		end


	end

end


class Register


	def register

		puts "Insert your username"
		user = gets.chomp
		puts "Insert your password"
		pass = gets.chomp

		@username = user
		@password = pass

		user_username = "user_" + @username
		user_username = Login.new(@username, @password, user_username)
		user_username.login


	end


end

Counter.new.start