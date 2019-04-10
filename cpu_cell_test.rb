require "minitest/autorun"
require_relative "cpu_cell.rb"

class Cell_Test < Minitest::Test
    
    def test_assert_to_s
        space = Cell.new
        assert_equal("~~", space.to_s())
    end

end