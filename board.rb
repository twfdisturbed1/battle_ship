require_relative 'ship.rb'
require_relative 'cell.rb'
require_relative 'cpu.rb'

class Board < Cell
    attr_accessor :size, :player1, :name, :end_point, :cell, :board, :player2, :start_point, :pos, :end_point
def initialize(size, cell)
    if cell == "player1"
        @board = Array.new(size) {Array.new(size) {Cell.new}}
    elsif cell == "cpu"
        @board = Array.new(size) {Array.new(size) {Cpucell.new}}
    end
    @size = size
    @end_point = size - 1
end



def place_ship(ship, row, col, pos)
    ship.size.times do 
        if pos == "horizontal" or pos == "h"
            self.board[row][col].take(ship)
            col += 1
        elsif pos == "vertical" or pos == "v"
            self.board[row][col].take(ship)
            row += 1
        end

    end
end

def atk_cell(row, col)
    if row < @size && col < @size && row >= 0 && col >= 0
        @board[row][col].if_hit()
    else
        return "invalid shot"
    end

end

def pick_open_cell()
    open_spot = []
    @board.each_with_index do |x, row|
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
    if pos == "horizontal" or pos == "h"
        col + ship.size < board.length && (col < board.length && row < board.length) ? true : false
    elsif pos == "vertical" or pos == "v"
        row + ship.size < board.length && (col < board.length && row < board.length) ? true : false
    else 
        err()
    end
        
end

def check_spot(ship, row, col, pos)
    ship.size.times do 
        # p self.board[row][col].status
        # p self.board[row][col].content
        if self.board[row][col].content != "~~ "
           return false 
        elsif pos == "horizontal" or pos == "h" or pos =="H" or pos == "Horizontal"
            col += 1
        elsif pos == "vertical" or pos == "v" or pos == "V" or pos== "Vertical"
            row += 1
        end 
    end
   return true
end

def main(ship, row, col, pos)
    if check_location(ship, row, col, pos) == true && check_spot(ship, row, col, pos) == true
        place_ship(ship, row, col, pos)
    else 
        err()
    end

end

end