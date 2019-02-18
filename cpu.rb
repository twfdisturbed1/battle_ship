require_relative 'ship.rb'
require_relative 'board.rb'
require_relative 'cpu_cell.rb'


class Cpu < Cpucell
    attr_reader :spots, :spots_to_fire, :coordinates, :ships
    def initialize(board, opp_board)
        @board = board
        num = []
        @coordinates = []
        @ships = [battle_ship = Ship.new(5, "(B)"), cruiser = Ship.new(4, "(C)"), submarine = Ship.new(3, "(S)"), destroyer = Ship.new(2, "(D)")]
        counter = 0
        @board.size.times do 
            num << counter
            counter += 1
        end
        num.each do |row|
            num.each do |col|
                @coordinates << [row, col]
            end
        end
    end

    def deploy_opp_ships()
        counter = 0 
        4.times do 
            while true
                spots_2_choose = @coordinates
                hold_it = spots_2_choose.sample
                pos = ["horizontal", "vertical"]
                if @board.main(@ships[counter], hold_it[0], hold_it[1], pos.sample) != "Not a valid move"
                    counter += 1
                    spots_2_choose.delete(hold_it)
                    break
                end
            end
        end 
    end

    def help_find()

    end
end
