#!/usr/bin/env ruby
require_relative 'image'

class CommandLine

	def image(x, y)
		# raise "Error" unless commands.join(" ") == commands.join(" ")[/\A(I) (\d) (\d)\z/]
		@new_image = Image.new(x, y)
	end

	def show 
		puts @new_image.to_image		
	end	

	def clear
		@new_image.clear!
	end	

	def colour(x, y, colour)
		@new_image.colour!(x, y, colour)
	end	

	def horizontal(x1, x2, y, colour)
		@new_image.vertical!(x1, x2, y, colour)
	end

	def vertical(x, y1, y2, colour)
		@new_image.horizontal!(x, y1, y2, colour)
	end
		
	def fill(x, y, colour)
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
			when "V" then horizontal(commands[1], commands[2], commands[3], commands[4])
			when "H" then vertical(commands[1], commands[2], commands[3], commands[4])
			when "F" then fill(commands[1], commands[2], commands[3])
			when "X" then stop
			# else puts "Wrongcommands, you idiot!"
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
			commands = gets.chomp.split(" ")
			commands.map! {|c| /^\d$/ =~ c ? c.to_i : c}			
			execute commands
		end
	end

end

# CommandLine.new.run!