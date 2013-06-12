#!/usr/bin/env ruby
require './image'

class CommandLine

	attr_accessor :input

	def new_image
		@new_image = Image.new(input[1].to_i, input[2].to_i)
	end

	# def show
	# 	puts @new_image.to_image	
	# end	   

	def run!
		input = nil
		while input != ["X"]
			print "> "
			input = gets.chomp.split(" ")

			case input[0]
			when "I" then @new_image
			when "S" then puts @new_image.to_image	
			end

		end
	end

end

CommandLine.new.run!