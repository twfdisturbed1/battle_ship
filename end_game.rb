require_relative 'board.rb'
require_relative 'ship.rb'
require_relative 'cell.rb'
require_relative 'cpu_cell.rb'
require_relative 'cpu.rb'

def end_game(board, cpuboard)
    player_place = 0
    cpu_place = 0
    @winner = " "
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
        @winner = "A Winner is you!"
     elsif player_place == 14
         return "They Saken your Battle Ships "
         @winner = "They Saken your Battle Ships "
        else 
        return ""
     end
 end