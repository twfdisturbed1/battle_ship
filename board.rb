require_relative 'ship.rb'
require_relative 'cell.rb'
require_relative 'cpu.rb'

class Board < Cell
    attr_accessor :size, :player1, :name, :end_point, :cell, :board, :player2, :start_point, :pos, :end_point, :cpuboard, :row, :col
def initialize(size, cell)
    if cell == "player1"
        @board = Array.new(size) {Array.new(size) {Cell.new}}
    elsif cell == "cpu"
        @board = Array.new(size) {Array.new(size) {Cpucell.new}}
    end
    @size = size
    @end_point = size - 1
end

def hit_or_miss(cpuboard, replyrow, replycol)
    if cpuboard.board[replyrow.to_i][replycol.to_i].content.class == Ship
        return cpuboard.board[replyrow.to_i][replycol.to_i].content.ship_status
    else
        return "Miss!"
    end
end

def place_ship(ship, row, col, pos)
    ship.size.times do 
        if pos == "horizontal" or pos == "h" or pos =="H" or pos == "Horizontal"
            @board[row][col].take(ship)
            col += 1
        elsif pos == "vertical" or pos == "v" or pos == "V" or pos == "Vertical"
            @board[row][col].take(ship)
            row += 1
        end

    end
end

def atk_cell(row, col)
    if row < @size && col < @size && row >= 0 && col >= 0
      return @board[row][col].if_hit()
    else
        return "Not a valid shot"
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
    return "Not a valid move"
end

def check_location(ship, row, col, pos)
    if pos == "horizontal"
    col + ship.size < @board.length + 1 && (col < @board.length && row < board.length + 1) ? true : false
    elsif pos == "vertical" or pos == "v" or pos == "V" or pos == "Vertical"
        row + ship.size < @board.length + 1 && (col < @board.length && row < board.length + 1) ? true : false
    else 
        err()
    end
        
end

def check_spot(ship, row, col, pos)
    ship.size.times do
        # p "Ship size is  #{ship.size}" 
        # p "Col is #{col}"
        # p "Row is #{row}"
        # p self.board[row][col].status
        # p self.board[row][col].content
        if self.board[row][col].status != "open"
           return false 
        elsif pos == "horizontal" 
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

def end_game(board, cpuboard)
    player_place = 0
    cpu_place = 0
    board.board.each do |row|
        row.each do |cell|
            if cell.status == "X"
                player_place += 1
            end
        end
    end

    cpuboard.board.each do |row|
        row.each do |cell|
            if cell.status == "X"
                cpu_place += 1
            end
        end
    end

    if cpu_place == 14
       return  "A Winner is you!"
       win_or_lose = "A Winner is you!"
    elsif player_place == 14
        return "They Saken your Battle Ships "
        win_or_lose = "They Saken your Battle Ships "
    else 
       return ""
    end
end
# win_or_lose = ""
