require "minitest/autorun"
require_relative "cell.rb"

class Cell_Test < Minitest::Test
    
    def test_assert_initialize
        space = Cell.new
        assert_equal("open", space.status)
    end

    def test_assert_initialize_content
        space = Cell.new
        assert_equal("~~", space.content)
    end

    def test_assert_if_hit
        space = Cell.new
        space.if_hit()
        assert_equal("O", space.status)
    end

    def test_assert_take_ship
        space = Cell.new
        battleship = Ship.new(5, "battleship")
        space.take(battleship)
        assert_equal("battleship", space.name)
    end

    def test_assert_take_ship_status
        space = Cell.new
        battleship = Ship.new(5, "battleship")
        space.take(battleship)
        assert_equal("taken", space.status)
    end

    def test_assert_take_ship_content
        space = Cell.new
        battleship = Ship.new(5, "battleship")
        space.take(battleship)
        assert_equal(battleship, space.content)
    end

    def test_assert_to_s
        space = Cell.new
        assert_equal("~~", space.to_s())
    end

end