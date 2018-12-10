    require_relative 'ship.rb'
    
    puts "pick 1 or 2 or 3 for board size"
    puts "1 is 12 by 12 "
    puts "2 is 24 by 24 "
    puts "3 is 36 by 36 "
    start = 0
    size = 0
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

destroyer = Ship.new(2, "Destroyer", 2, "D")
submarine = Ship.new(3, "Submarine", 3, "S")
cruiser = Ship.new(4, "Cruiser", 4, "C")
battleship = Ship.new(5, "Battleship ", 5, "B")

turn = 0

new_board_player_one = Array.new(size) { Array.new(size,'~') }

new_board_player_two = Array.new(size) { Array.new(size,'~') }

# board_one = Array.new(size,Array.new(size,'~'))

# board_two = Array.new(size,Array.new(size,'~'))

puts "Player 1"
new_board_player_one.each do|v|
    p v
end

new_board_player_two[5][5] = destroyer.icon
new_board_player_two[5][6] = destroyer.icon

new_board_player_two[3][3] = submarine.icon
new_board_player_two[4][3] = submarine.icon
new_board_player_two[5][3] = submarine.icon

new_board_player_two[11][0] = cruiser.icon
new_board_player_two[11][1] = cruiser.icon
new_board_player_two[11][2] = cruiser.icon
new_board_player_two[11][3] = cruiser.icon

new_board_player_two[0][7] = battleship.icon
new_board_player_two[1][7] = battleship.icon
new_board_player_two[2][7] = battleship.icon
new_board_player_two[3][7] = battleship.icon
new_board_player_two[4][7] = battleship.icon

puts "Player 2"
new_board_player_two.each do|v|
    p v
end

puts "enter two number the first is your column the second is your row"

input_one = 0
input_two = 0
loop do
input_one = gets.chomp.to_i
input_two = gets.chomp.to_i
new_board_player_two[input_one.to_i][input_two.to_i]
        if new_board_player_two[input_one][input_two] == '~'
            new_board_player_two[input_one][input_two] = "M"
            break
        elsif new_board_player_two[input_one][input_two] == "M"
            puts "Try again"
            redo
        elsif
            new_board_player_two[input_one][input_two] == destroyer.icon
            destroyer.hit 
            if destroyer.hp == 0
                p destroyer.info
            else
                puts "Direct hit Pick again"
                new_board_player_two[input_one][input_two] = "X"
            end
            redo
        elsif
            new_board_player_two[input_one][input_two] == submarine.icon
            submarine.hit 
            if submarine.hp == 0
                p submarine.info
            else
                puts "Direct hit Pick again"
                new_board_player_two[input_one][input_two] = "X"
            end
            redo
        elsif
            new_board_player_two[input_one][input_two] == cruiser.icon
            cruiser.hit 
            if cruiser.hp == 0
                p cruiser.info
            else
                puts "Direct hit Pick again"
                new_board_player_two[input_one][input_two] = "X"
            end
            redo
        elsif
            new_board_player_two[input_one][input_two] == battleship.icon
            battleship.hit  
            if battleship.hp == 0
                p battleship.info
            else
                puts "Direct hit Pick again"
                new_board_player_two[input_one][input_two] = "X"
            end
            if battleship.hp == 0 and cruiser.hp == 0 and submarine.hp == 0 and destroyer.hp == 0
                puts "Player Two wins"
            else
            end
        redo
        else
            break
        end
    end

         puts "Player 2"
        new_board_player_two.each do|v|
            p v
        end