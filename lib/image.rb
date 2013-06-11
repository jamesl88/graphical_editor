class Image

	attr_accessor :width, :height, :pixel

	def initialize(n, m)
		@width = n
		@height = m
		clear!
	end

	def clear!
		array = Array.new(@width * @height)
		@pixel = array.map { |index| index = "O" }.each_slice(@width).to_a
		@pixel
	end

	def colour!(x, y, c)
		@pixel[y-1][x-1] = c
	end

	def to_image
		@pixel.map(&:join).join("\n")
	end

	def vertical!(x, y1, y2, c)
		column = (x-1) % @width
		((y1-1)..(y2-1)).each { |x| @pixel[x][column] = c }
	end

end