require 'test/unit'
require '../lib/image'
require '../lib/command_line'
require 'mocha/setup'

class CommandTest < Test::Unit::TestCase

	def setup
		@command_line = CommandLine.new
	end

	def test_image_can_be_created
		@command_line.expects(:image).once
		@command_line.execute(["I", 2, 2])
	end

	def test_can_exit_from_the_program
		@command_line.expects(:stop).once
		@command_line.execute(["X"])
	end

	def test_image_can_be_shown
		@command_line.expects(:show).once
		@command_line.execute(["S"])
	end

	def test_image_can_be_filled
		@command_line.expects(:fill).once
		@command_line.execute(["F", 1, 2, "C"])
	end

	def test_pixel_can_be_coloured
		@command_line.expects(:colour).once
		@command_line.execute(["L", 1, 2, "J"])
	end

	def test_horizontal_row_can_be_coloured
		@command_line.expects(:horizontal).once
		@command_line.execute(["H", 1, 2, 3, "C"])
	end

	def test_vertical_column_can_be_coloured
		@command_line.expects(:vertical).once
		@command_line.execute(["V", 1, 2, 3, "C"])
	end

	def test_image_can_be_cleared
		@command_line.expects(:clear).once
		@command_line.execute(["C"])
	end
end

