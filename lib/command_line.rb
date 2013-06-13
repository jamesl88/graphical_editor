#!/usr/bin/env ruby
require_relative 'image'

class CommandLine

	def image
		# puts "Please enter input in correct format I M N" unless @input.join(" ") == @input.join(" ")[/\A(I) (\d) (\d)\z/]
		@new_image = Image.new(@input[1].to_i, @input[2].to_i)
	end

	def show 
		puts @new_image.to_image		
	end	

	def clear
		@new_image.clear!
	end	

	def colour
		@new_image.colour!(@input[1].to_i, @input[2].to_i, @input[3])
	end	

	def horizontal
		@new_image.vertical!(@input[1].to_i, @input[2].to_i, @input[3].to_i, @input[4])
	end

	def vertical
		@new_image.horizontal!(@input[1].to_i, @input[2].to_i, @input[3].to_i, @input[4])
	end
		
	def fill
		@new_image.fill!(@input[1].to_i, @input[2].to_i, @input[3])
	end
		
	def run!
		@input = nil
		while @input != ["X"]
			print "> "
			@input = gets.chomp.split(" ")

			case @input[0]
			when "I" then image
			when "C" then clear	
			when "S" then show
			when "L" then colour
			when "V" then horizontal
			when "H" then vertical
			when "F" then fill
			# else puts "Wrong input, you idiot!"
			end
		end
	end

end

CommandLine.new.run!