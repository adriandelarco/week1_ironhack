require 'Imdb'
require 'pry'


movies_text = IO.read("movies.txt")
movies_text = movies_text.split("\n")
movie_array = []
movie_rating = []

movies_text.each do |movie|
  movie_array << Imdb::Search.new(movie)
end

movie_array.each do |item|

   movie_rating_1 = item.movies[0..0].collect{|m|m.rating}
   i = 0
   while  movie_rating_1[0] == nil
      i += 1
      movie_rating_1 = item.movies[i..i].collect{|m|m.rating}
   end
   movie_rating << movie_rating_1
end

i = 10
while i > 0 do
  movie_rating.each do |rating|
    if rating[0].to_i >= i
      print " |#| "
    else
      print " | | "
    end
  end
  puts "\n"
  i -= 1
end
puts "-----------------------------------------"
movie_rating.each_with_index do |rating, index|
  print " |#{index+1}| "
end
puts "\n\n"
movies_text.each_with_index do |name, index|
  puts "#{index + 1}. #{name}"
end


