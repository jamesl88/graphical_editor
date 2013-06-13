require 'test/unit'
require '../lib/image'
require '../lib/command_line'
require 'mocha/setup'

class CommandTest < Test::Unit::TestCase

	def setup
		@command_line = CommandLine.new
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
end

