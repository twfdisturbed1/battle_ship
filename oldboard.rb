b_board = [ " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "] 
i_board = [ " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "]
e_board = [ " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "] 

    puts "pick 1 or 2 or 3 for board size"
    start = 0
    board = []
loop do
start = gets.chomp.to_i
    if start == 1
        12.times do 
            board << b_board.flatten
        # p b_board
        end
        break
    
    elsif start == 2
        24.times do 
            board << i_board.flatten
        # p i_board
         end
         break
    

    elsif start == 3
        36.times do 
            board << e_board.flatten
        # p e_board
        end
        break
    else    
    puts "Pick a valid number"
    redo
    end
end
# p board.flatten
# print board.flatten
puts "Test"
# board.flatten[1].replace("O")
# board.flatten[2].replace("O")


# board.flatten[50].replace("B")
# board.flatten[51].replace("B")
# board.flatten[52].replace("B")

# board.flatten[31].replace("O")
# board.flatten[32].replace("O")
# board.flatten[33].replace("O")
# board.flatten[34].replace("O")

# board.flatten[101].replace("B")
# board.flatten[102].replace("B")
# board.flatten[103].replace("B")
# board.flatten[104].replace("B")
# board.flatten[105].replace("B")

p board.flatten.length

size = 12
x = Array.new(size,Array.new(size," "))

x.each do|v|
    p v
end

board.each do|v|
    p v
end


