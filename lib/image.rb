class Image

	attr_accessor :width, :height, :pixels

	def initialize(n, m)
		@width, @height = n, m; clear!
	end

	def clear!		
		@pixels = Array.new(@height) { Array.new(@width) { "O" } }
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
		orig_colour = @pixels[y-1][x-1]
		recursive_fill(x-1, y-1, colour, orig_colour)
	end

	def adjacent(x, y)
		adjacent = [-1,0,+1].repeated_permutation(2).map { |i| [i[0]+x, i[1]+y] } - [[x,y]]
		adjacent.select { |p| p[0].between?(0,(@width-1)) && p[1].between?(0,(@height-1)) }
	end	

	def recursive_fill(x, y, colour, orig_colour)
		@pixels[y][x] = colour
		adjacent(x, y).each { |pixel|
			pixel_x, pixel_y = pixel[0], pixel[1]
			recursive_fill(pixel_x, pixel_y, colour, orig_colour) if @pixels[pixel_y][pixel_x] == orig_colour } 
	end	
end