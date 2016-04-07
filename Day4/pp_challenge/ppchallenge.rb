require 'ruby-dictionary'
require 'pry'

class WordChain
	def initialize(dictionary)
		@dictionary = dictionary
	end
	
	def find_chain(first_word,last_word)

		@array_first_word = first_word.split
		@aux_array = first_word.split
		@array_last_word = last_word.split
		@array_first_word.each{ |item| 

			change_letter
		}
 		puts @array_first_word.join("")
		
		
	end
	def change_letter
		@array_first_word.each_with_index do |letter, index|
			puts "a"
			if @array_first_word[index] != @array_last_word[index]
				@array_first_word[index] = @array_last_word[index]
				new_word = @array_first_word.join
				if @dictionary.exists?(new_word) 
					@array_first_word = new_word.split
					puts "a"  #NO LLEGA A IMPRIMIR LOS PASOS INTERMEDIOS, REVISAR
					break
				else
					@array_first_word[index] = @aux_array[index]
				end
			end
		end
	end
end


dictionary = Dictionary.from_file("/usr/share/dict/words")
my_chain = WordChain.new(dictionary)
my_chain.find_chain("cat","dog")