require 'minitest/autorun'
require '../lib/image'

class ImageTest < MiniTest::Unit::TestCase

	def setup
		@image = Image.new(5,6)
	end	

	def test_create_image_with_and_height
		assert_equal 5, @image.width
		assert_equal 6, @image.height
	end

	def test_all_the_pixels_are_white
		# @image.new_image
		assert_equal "OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO", @image.to_image
	end

	def test_a_pixel_can_be_coloured
		# @image.new_image
		@image.colour!(2, 3, "A")
		assert_equal "OOOOO\nOOOOO\nOAOOO\nOOOOO\nOOOOO\nOOOOO", @image.to_image
	end

	def test_C_clears_the_table_and_converts_all_to_O
		@image.colour!(2, 3, "A")
		refute_equal "OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO", @image.to_image
		@image.clear!
		assert_equal "OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO", @image.to_image
	end 

	def test_vertical_colour_segment_method_works
		# @image.vertical!(2,3,4,"W")
		assert_equal "OOOOO\nOOOOO\nOWOOO\nOWOOO\nOOOOO\nOOOOO", @image.to_image
		
	end
end