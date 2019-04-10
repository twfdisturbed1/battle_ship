require "minitest/autorun"
require_relative "ship.rb"

class Ship_Test < Minitest::Test
    
    def test_assert_initialize_size
        boat = Ship.new(3, "sub")
        assert_equal(3, boat.size)
    end

    def test_assert_initialize_name
        boat = Ship.new(3, "sub")
        assert_equal("sub", boat.name)
    end
    
    def test_assert_initialize_hp
        boat = Ship.new(3, "sub")
        assert_equal(0, boat.hp)
    end

    def test_assert_type_of_ship
        boat = Ship.new(3, "sub")
        assert_equal("sub", boat.type_of_ship())
    end

    def test_assert_size_of_ship
        boat = Ship.new(3, "sub")
        assert_equal(3, boat.size_of_ship())
    end

    def test_assert_hitter
        boat = Ship.new(3, "sub")
        assert_equal(0, boat.hitter())
    end


    def test_assert_info
        boat = Ship.new(3, "sub")
        assert_equal( "sub Ship size is 3 Ships Hp is  0", boat.info)
    end

    def test_assert_take_a_hit
        boat = Ship.new(3, "sub")
        assert_equal( "Direct Hit !!", boat.take_a_hit())
    end

    def test_assert_take_a_hit_last_shot
        boat = Ship.new(3, "sub")
        boat.take_a_hit()
        boat.take_a_hit()
        assert_equal(" was Sunk!", boat.take_a_hit())
    end

end