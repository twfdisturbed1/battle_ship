    require_relative 'ship.rb'
    require 'colorize'
    class Board 
        attr_accessor :size, :player1, :set_player1
        attr_reader :board, :water, :player2
    def initialize(size)
        @size = size
        @content = '~'
        @board= Array.new(size) {Array.new(size, @content)}
        @player1 = player1
        @player2 = "CPU"
    end

    def player1
        @player1
    end

    def player2
        @player2
    end

    def set_player1(player_name)
        @player1 = player_name
    end

    def size 
        @size = size
    end

end

# def place_ship(ship, start_position, orientation)
# 	row = start_position[:row]
# 	column = start_position[:column]
# 	ship.length.times do
# 		if orientation == :horizontal
# 			self.grid[row][column].ship = ship
# 			self.grid[row][column].status = :occupied
# 			column += 1
# 		else
# 			self.grid[row][column].ship = ship
# 			self.grid[row][column].status = :occupied
# 			row += 1
# 		end
# 	end
# end
puts "Whats your Name ? ".colorize(:red)
player_name = gets.chomp
p player_name

size = 0
    puts "pick 1 or 2 or 3 for board size"
    puts "1 is 12 by 12 "
    puts "2 is 24 by 24 "
    puts "3 is 36 by 36 "
    start = 0
loop do
start = gets.chomp.to_i
    if start == 1
    size = 12
    break
    
    elsif start == 2
       size = 24
    break
    
    elsif start == 3
        size = 36
    break
    else    
    puts "Pick a valid number"
    redo
    end
end
$new_board_player_one = Board.new(size)
$new_board_player_two = Board.new(size)



$new_board_player_one.board.each do|v|
    p v
end

destroyer_1 = Ship.new(2, "Destroyer", 2, "D", 2)
submarine_1 = Ship.new(3, "Submarine", 3, "S", 3)
cruiser_1 = Ship.new(4, "Cruiser", 4, "C", 4)
battleship_1 = Ship.new(5, "Battleship ", 5, "B", 5)

destroyer_2 = Ship.new(2, "Destroyer", 2, "D", 2)
submarine_2 = Ship.new(3, "Submarine", 3, "S", 3)
cruiser_2 = Ship.new(4, "Cruiser", 4, "C", 4)
battleship_2 = Ship.new(5, "Battleship ", 5, "B", 5)

turn = 0

# p_one_input_one = 0
# p_one_input_two = 0
# puts "place your ships".colorize(:blue)
# puts "Destroyer".colorize(:red)
# counter = 0
# loop do
#     if counter == 2
#         break 
#         else
#             puts "Pick column".colorize(:yellow)    
#         p_one_input_one = gets.chomp.to_i
#             if p_one_input_one > size and p_one_input_one >= 0
#                 puts "please pick a valid column number".colorize(:yellow)
#                 redo
#                 else
#                 puts "Pick Row #".colorize(:red)
    
#                 p_one_input_two = gets.chomp.to_i
#                 if p_one_input_two > size and p_one_input_one >= 0
#                     puts "please pick a valid row  number".colorize(:red)
#                     redo
#                     else
#                         counter += 1
#                 end
#             end
#             end
#             if $new_board_player_one.board[p_one_input_one][p_one_input_two] == '~'
#     $new_board_player_one.board[p_one_input_one][p_one_input_two] = destroyer_1.icon
#     $new_board_player_one.board[p_one_input_one][p_one_input_two + 1] = destroyer_1.icon
#     counter = 2
#                 else
#                     counter -= 1
#                 end
# end
counter = 0

p_one_input_one = 0
p_one_input_two = 0
ship_orientation = " "
puts "place your ships".colorize(:blue)
puts "Destroyer".colorize(:red)
loop do
puts "Would you like the ship Horizontal or Vertical"
ship_orientation = gets.chomp.to_s.downcase
        if ship_orientation == "horizontal" or ship_orientation == "h" or ship_orientation == "vertical" or ship_orientation == "v"
            break 
        else
            redo
            puts "Invalid Choice please choose again"
        end
    end
loop do
    if counter == 2
        break 
        else

puts "Pick column".colorize(:yellow)    
        p_one_input_one = gets.chomp.to_i
            if p_one_input_one > size and p_one_input_one >= 0
                puts "please pick a valid column number".colorize(:yellow)
                redo
                else
                puts "Pick Row #".colorize(:red)
    
                p_one_input_two = gets.chomp.to_i
                if p_one_input_two > size and p_one_input_one >= 0
                    puts "please pick a valid row  number".colorize(:red)
                    redo
                    else
                        counter += 2
                end
            end
            end
            if $new_board_player_one.board[p_one_input_one][p_one_input_two] == '~' and ship_orientation == "horizontal" or $new_board_player_one.board[p_one_input_one][p_one_input_two] == '~' and ship_orientation == "h"
    $new_board_player_one.board[p_one_input_one][p_one_input_two] = destroyer_1.icon
    $new_board_player_one.board[p_one_input_one][p_one_input_two + 1] = destroyer_1.icon
    counter = 2
            elsif $new_board_player_one.board[p_one_input_one][p_one_input_two] == '~' and ship_orientation == "vertical" or $new_board_player_one.board[p_one_input_one][p_one_input_two] == '~' and ship_orientation == "v"
                $new_board_player_one.board[p_one_input_one][p_one_input_two] = destroyer_1.icon
                $new_board_player_one.board[p_one_input_one + 1][p_one_input_two] = destroyer_1.icon
                counter = 2 
                else
                    counter -= 1
                end
end
$new_board_player_one.board.each do|v|
    p v
end
counter = 0

puts "place your ships".colorize(:yellow)
puts "Submarine".colorize(:black)
loop do
if counter == 3
    break 
    else
        puts "Pick column".colorize(:yellow)    
    p_one_input_one = gets.chomp.to_i
        if p_one_input_one > size and p_one_input_one >= 0
            puts "please pick a valid number".colorize(:yellow)
            redo
            else
            puts "Pick Row #".colorize(:red)

            p_one_input_two = gets.chomp.to_i
            if p_one_input_two > size and p_one_input_one >= 0
                puts "please pick a valid number".colorize(:red)
                redo
                else
                    counter += 1
            end
        end
        end
        if $new_board_player_one.board[p_one_input_one][p_one_input_two] == '~'
            $new_board_player_one.board[p_one_input_one][p_one_input_two] = submarine_1.icon
                        else
                            counter -= 1
                        end
    end
    counter = 0
    puts "place your ships".colorize(:yellow)
    puts "Cruiser".colorize(:orange)
    loop do

if counter == 4
    break 
    else   
        puts "Pick column".colorize(:yellow)    
        p_one_input_one = gets.chomp.to_i
            if p_one_input_one > size and p_one_input_one >= 0
                puts "please pick a valid number".colorize(:yellow)
                redo
                else
                puts "Pick Row #".colorize(:red)
    
                p_one_input_two = gets.chomp.to_i
                if p_one_input_two > size and p_one_input_one >= 0
                    puts "please pick a valid number".colorize(:red)
                    redo
                    else
                        counter += 1
                end
        end
    end
    if $new_board_player_one.board[p_one_input_one][p_one_input_two] == '~'
        $new_board_player_one.board[p_one_input_one][p_one_input_two] = cruiser_1.icon
                    else
                        counter -= 1
                    end
end
counter = 0
puts "place your ships".colorize(:yellow)
puts "Battle Ship".colorize(:grey)
loop do
if counter == 5
    break 
    else   
        puts "Pick column".colorize(:yellow)    
        p_one_input_one = gets.chomp.to_i
            if p_one_input_one > size and p_one_input_one >= 0
                puts "please pick a valid number".colorize(:yellow)
                redo
                else
                puts "Pick Row #".colorize(:red)
    
                p_one_input_two = gets.chomp.to_i
                if p_one_input_two > size and p_one_input_one >= 0
                    puts "please pick a valid number".colorize(:red)
                    redo
                    else
                        counter += 1
                end
        end
    end
    if $new_board_player_one.board[p_one_input_one][p_one_input_two] == '~'
        $new_board_player_one.board[p_one_input_one][p_one_input_two] = battleship_1.icon
                    else
                        counter -= 1
                    end
end
puts "Player 1"
$new_board_player_one.board.each do|v|
    p v
end

$new_board_player_two.board[5][5] = destroyer_2.icon
$new_board_player_two.board[5][6] = destroyer_2.icon

$new_board_player_two.board[3][3] = submarine_2.icon
$new_board_player_two.board[4][3] = submarine_2.icon
$new_board_player_two.board[5][3] = submarine_2.icon

$new_board_player_two.board[11][0] = cruiser_2.icon
$new_board_player_two.board[11][1] = cruiser_2.icon
$new_board_player_two.board[11][2] = cruiser_2.icon
$new_board_player_two.board[11][3] = cruiser_2.icon

$new_board_player_two.board[0][7] = battleship_2.icon
$new_board_player_two.board[1][7] = battleship_2.icon
$new_board_player_two.board[2][7] = battleship_2.icon
$new_board_player_two.board[3][7] = battleship_2.icon
$new_board_player_two.board[4][7] = battleship_2.icon

puts "Player 2"
$new_board_player_two.board.each do|v|
    p v
end

puts "enter two number the first is your column the second is your row".colorize(:green)

input_one = 0
input_two = 0
loop do
input_one = gets.chomp.to_i
input_two = gets.chomp.to_i

    $new_board_player_two.board[input_one.to_i][input_two.to_i]       
        if $new_board_player_two.board[input_one][input_two] == '~'
            $new_board_player_two.board[input_one][input_two] = "M"
            puts "Miss"
            # break
        elsif $new_board_player_two.board[input_one][input_two] == "M"
            puts "Try again"
            redo
        elsif
            $new_board_player_two.board[input_one][input_two] == destroyer_2.icon
            destroyer_2.hit 
            if destroyer_2.hp == 0
                $new_board_player_two.board[input_one][input_two] = "X"
                p destroyer_2.info
            else
                puts "Direct hit Pick again"
                $new_board_player_two.board[input_one][input_two] = "X"
            end
            redo
        elsif
            $new_board_player_two.board[input_one][input_two] == submarine_2.icon
            submarine_2.hit 
            if submarine_2.hp == 0
                $new_board_player_two.board[input_one][input_two] = "X"
                p submarine_2.info
            else
                puts "Direct hit Pick again"
                $new_board_player_two.board[input_one][input_two] = "X"
            end
            redo
        elsif
            $new_board_player_two.board[input_one][input_two] == cruiser_2.icon
            cruiser_2.hit 
            if cruiser_2.hp == 0
                $new_board_player_two.board[input_one][input_two] = "X"
                p cruiser_2.info
            else
                puts "Direct hit Pick again"
                $new_board_player_two.board[input_one][input_two] = "X"
            end
            redo
        elsif
            $new_board_player_two.board[input_one][input_two] == battleship_2.icon
            battleship_2.hit  
            if battleship_2.hp == 0
                $new_board_player_two.board[input_one][input_two] = "X"
                p battleship_2.info
            else
                puts "Direct hit Pick again"
                $new_board_player_two.board[input_one][input_two] = "X"
            end
            if battleship_2.hp == 0 and cruiser_2.hp == 0 and submarine_2.hp == 0 and destroyer_2.hp == 0
                puts "Player Two wins"
                puts "Player 2"
                $new_board_player_two.board.each do|v|
                    p v
                end
                exit
            else
            end
        redo
        else
            redo
            # break
        end
    redo

end


         puts "Player 2"
        $new_board_player_two.board.each do|v|
            p v
        end