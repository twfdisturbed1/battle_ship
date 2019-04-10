require "minitest/autorun"
require_relative "cpu.rb"

class Cell_Test < Minitest::Test
    
    def test_assert_to_s
        player_board = Board.new(12, "player1")
        cpu_board = Board.new(12, "cpu")
        computer = Cpu.new(player_board, cpu_board)
        assert_equal("~~", computer)
    end

end