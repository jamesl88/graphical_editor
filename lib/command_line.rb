#!/usr/bin/env ruby
require_relative 'image'

class CommandLine
	
	def image(x, y)
		raise unless @commands.join(" ")[/\A(I) (\d+) (\d+)\z/i]
		@new_image = Image.new(x, y)
	end

	def show 
		puts @new_image.to_image		
	end	

	def clear
		@new_image.clear!
	end	

	def colour(x, y, colour)
		raise unless @commands.join(" ")[/\A(L) (\d+) (\d+) ([a-z])\z/i]
		@new_image.colour!(x, y, colour)
	end	

	def horizontal(x1, x2, y, colour)
		raise unless @commands.join(" ")[/\A(H) (\d+) (\d+) (\d+) ([a-z])\z/i]
		@new_image.horizontal!(x1, x2, y, colour)
	end

	def vertical(x, y1, y2, colour)
		raise unless @commands.join(" ")[/\A(V) (\d+) (\d+) (\d+) ([a-z])\z/i]
		@new_image.vertical!(x, y1, y2, colour)
	end
		
	def fill(x, y, colour)
		raise unless @commands.join(" ")[/\A(F) (\d+) (\d+) ([a-z])\z/i]
		@new_image.fill!(x, y, colour)
	end

	def stop
	 	puts "Have a nice day!"
	 	exit 
	end	

	def input(commands)
		case commands.first
			when "I" then image(commands[1], commands[2])
			when "C" then clear	
			when "S" then show
			when "L" then colour(commands[1], commands[2], commands[3])
			when "V" then vertical(commands[1], commands[2], commands[3], commands[4])
			when "H" then horizontal(commands[1], commands[2], commands[3], commands[4])
			when "F" then fill(commands[1], commands[2], commands[3])
			when "X" then stop
			else puts "That is not a valid command"
		end
	end

	def execute(commands)
		begin
			input(commands)
		rescue
			puts "Please enter commands in correct format"
		end
	end	
		
	def run!
		while true
			print "> "	
			@commands = gets.chomp.upcase.split(" ")
			@commands.map! {|c| /^\d+$/ =~ c ? c.to_i : c}		
			execute @commands
		end
	end
end
