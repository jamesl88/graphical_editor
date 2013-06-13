require 'minitest/autorun'
require '../lib/image'
require '../lib/command_line.rb'

class CommandTest < MiniTest::Unit::TestCase

	def test_can_exit_from_the_program
		command_line = CommandLine.new
		command_line.expect(:stop)
		command_line.input('X')
		command_line.verify		
	end

	def test_image_can_be_shown
		image = Minitest::Mock.new
		command_line = CommandLine.new(image)
		image.expect(:show)
		command_line.input("S")
		image.verify
	end

	def test_the_repl
		image = Minitest::Mock.new
		command_line = CommandLine.new(image)
		def command_line.gets; "X\n"; end
		command_line.expect(:stop)
		command_line.run!
	end

end

