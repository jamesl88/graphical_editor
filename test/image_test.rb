require 'minitest/autorun'
require '../lib/image'

class ImageTest < MiniTest::Unit::TestCase

	def setup
		@image = Image.new(5,6)
	end	

	def test_create_image_width_and_height
		assert_equal 5, @image.width
		assert_equal 6, @image.height
	end

	def test_all_the_pixels_are_white_on_creation
		assert_equal "OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO", @image.to_image
	end

	def test_a_pixel_can_be_coloured
		@image.colour!(2, 3, "A")
		assert_equal "OOOOO\nOOOOO\nOAOOO\nOOOOO\nOOOOO\nOOOOO", @image.to_image
	end

	def test_clearing_the_table_converts_all_values_to_O
		@image.colour!(2, 3, "A")
		refute_equal "OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO", @image.to_image
		@image.clear!
		assert_equal "OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO", @image.to_image
	end 

	def test_colour_vertical_segments
		@image.vertical!(2 ,3, 5,"W")
		assert_equal "OOOOO\nOOOOO\nOWOOO\nOWOOO\nOWOOO\nOOOOO", @image.to_image
	end

	def test_colour_horizontal_segments
		@image.horizontal!(3, 4, 2, "Z")
		assert_equal "OOOOO\nOOZZO\nOOOOO\nOOOOO\nOOOOO\nOOOOO", @image.to_image
	end	

	def test_fill  
		@image.vertical!(3, 1, 6, "Z")
		@image.fill!(2, 3, "J")
		assert_equal "JJZOO\nJJZOO\nJJZOO\nJJZOO\nJJZOO\nJJZOO", @image.to_image
		@image.clear!
		@image.horizontal!(1, 5, 3, "Z")
		@image.fill!(1, 1, "J")
		assert_equal "JJJJJ\nJJJJJ\nZZZZZ\nOOOOO\nOOOOO\nOOOOO", @image.to_image
	end
	
end