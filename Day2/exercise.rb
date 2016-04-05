require 'colorize'

class Blog

	def initialize
		@posts = []
		@number_of_pages = 0
		@a = 0
		@active_page = 1
	end

	def add_post(post)
		@posts.push(post)
	end

	def sort
		#Ordena los posts
		@posts.sort_by! {|post| post.date}
	end

	def publish_posts

		@page = @posts.slice(@a, 3)
		#Imprimir la pagina
		@page.each_with_index do |post, index|
			#Publica cada post
			if post.sponsored == 1
				puts "******" + post.title.colorize(:red)	+ "******"
			else
				puts post.title.colorize(:red)
			end
			puts "**************"
			puts post.body.colorize(:yellow)
			puts "----------------"
		end

		print_number_pages

	end

	def print_number_pages

		if @number_of_pages > 0
			#Imprime el numero de paginas y marca la actual
			i = 0
			puts "\n"
			while i < @number_of_pages
			    page = i + 1
			    if page == @active_page
					print "*#{page}* ".colorize(:blue)
				else
					print "#{page} "
				end
				i += 1
			end
			puts "\n"
		end

	end

	def create_front_page

		
		@number_of_pages = 0
		@posts.each_with_index do |post, index|
			if (index % 3 == 0)
				@number_of_pages += 1
			end
		end
		publish_posts
		if @number_of_pages > 0
			move_page
		end

	end

	def move_page

		move_to_page = gets.chomp

		if move_to_page == "next" && (@a + 4) < (@posts.length + 1)
			@active_page += 1
			@a += 3
			@page = @posts.slice(@a,3)
			create_front_page
		elsif move_to_page == "prev" && (@a - 2) > 0
			@active_page -= 1
			@a -= 3
			@page = @posts.slice(@a,3)
			create_front_page
		elsif move_to_page == "exit"
		else
			puts "This is the last page."
			move_page		
		end

	end

end

class Post
	attr_reader(:title, :body, :date, :sponsored)
	def initialize (title, body, date ,sponsored)
		@title = title
		@body =  body
		@sponsored =  sponsored
		@date = date
	end

end

blog = Blog.new
blog.add_post (Post.new("TITULO 1", "Asojio w", 4, 0))
blog.add_post (Post.new("TITULO 2", "bbbbbb", 1, 1))
blog.add_post (Post.new("TITULO 3", "ccccc", 2, 0))
blog.add_post (Post.new("TITULO 4", "dddddd", 4, 0))
blog.add_post (Post.new("TITULO 5", "eeeee", 1, 1))
blog.add_post (Post.new("TITULO 6", "fffffff", 2, 0))
blog.add_post (Post.new("TITULO 7", "fffffff", 5, 0))


blog.create_front_page