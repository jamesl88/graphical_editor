class Image

	attr_accessor :width, :height, :pixels

	def initialize(n, m)
		@width, @height = n, m; clear!
	end

	def clear!		
		@pixels = Array.new(@height) { Array.new(@width) { "O"} }
	end

	def colour!(x, y, colour)
		@pixels[y-1][x-1] = colour
	end

	def to_image
		@pixels.map(&:join).join("\n")
	end

	def vertical!(x, y1, y2, colour)
		column = (x-1) % @width
		((y1-1)..(y2-1)).each { |x| @pixels[x][column] = colour }
	end

	def horizontal!(x1, x2, y, colour)
		row = y - 1
		((x1-1)..(x2-1)).each { |x| @pixels[row][x] = colour }
	end

	def fill!(x, y, colour)
		original_colour = @pixels[y-1][x-1]
		recursive_fill(x, y, colour, original_colour)		
	end

	private

	def recursive_fill(x, y, colour, original_colour)
		adjacent = [ [x-1, y-1], [x , y-1], [x+1, y-1], [x+1, y], [x+1, y+1], [x, y+1], [x-1, y+1], [x-1, y] ]
		
		@pixels[y-1][x-1] = colour

		adjacent.each do |pixel|
			recursive_fill(pixel[0], pixel[1], colour, original_colour) if colour == original_colour 
			# recursive_fill(x, y, colour, original_colour) if pixel == original_colour 
		end	   
	end	
end