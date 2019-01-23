require_relative "ship.rb"
require_relative "cell.rb"
require_relative "enemy_cell.rb"

class Grid < Cell
    def initialize(size = 12, cell)
        if cell == "player"
            @grid = Array.new(size) {Array.new(size) {Cell.new}}
        elsif cell == "ai"
            @grid = Array.new(size) {Array.new(size) {Enemycell.new}}
        end
        @size = size
        @end_point = size - 1
    end

    def place_ship(ship, row, col, pos)
        ship.size.times do 
            if pos == "horizontal"
                self.grid[row][col].take(ship)
                col += 1
            else
                self.grid[row][col].take(ship)
                row += 1
            end

        end

                
    end

    def atk_cell(row, col)
        if row < @size && col < @size && row >= 0 && col >= 0
            return @grid[row][col].if_hit()
        else
            return "invalid shot"
        end

    end

    def pick_open_cell()
        open_spot = []
        @grid.each_with_index do |x, row|
            x.each_with_index do |y, col|
                if y.status == "open" || y.status == "taken"
                    open_spot << [row, col]
                end
            end
        end
        return open_spot.sample
    end


    def err()
        return "Invalid Placement!"
    end

    def check_location(ship, row, col, pos)
        if pos == "horizontal"
            col + ship.size < grid.length && (col < grid.length && row < grid.length) ? true : false
        elsif pos == "vertical"
            row + ship.size < grid.length && (col < grid.length && row < grid.length) ? true : false
        else 
            err()
        end
            
    end

    def check_spot(ship, row, col, pos)
        ship.size.times do 
            if self.grid[row][col].status != "open"
               return false 
            elsif pos == "horizontal"
                col += 1
            else
                row += 1
            end 
        end
       return true
    end

    def mastor_funk(ship, row, col, pos)
        if check_location(ship, row, col, pos) == true && check_spot(ship, row, col, pos) == true
            place_ship(ship, row, col, pos)
        else 
            err()
        end

    end
    


    attr_reader :start_point
    attr_reader :grid
    attr_reader :size
    attr_reader :pos
    attr_reader :end_point
end

