    require_relative 'board.rb'
    require_relative 'ship.rb'
    require_relative 'cell.rb'
    require_relative 'cpu_cell.rb'
    require_relative 'cpu.rb'
    
# puts "Whats your Name ? "
# player_name = gets.chomp.capitalize
# player2 = "CPU"
# p player_name

# size = 0
# puts "pick 1 or 2 or 3 for board size"
# puts "1 is 12 by 12 "
# puts "2 is 24 by 24 "
# puts "3 is 36 by 36 "
# start = 0
# loop do
# start = gets.chomp.to_i
# if start == 1
# size = 12
# break

# elsif start == 2
#    size = 24
# break

# elsif start == 3
#     size = 36
# break
# else    
# puts "Pick a valid number"
# redo
# end
# end
# new_board = Board.new(size, "player1") 
# new_board_cpu = Board.new(size, "cpu") 
# cpu = Cpu.new(new_board_cpu, new_board)

def show_board(o)
    countertop = 0
    print " "
    o.board.each_with_index do |v, i|
        if countertop < 10
        print "  #{countertop}"
        countertop += 1
        else print " #{countertop}"
            countertop += 1
        end
    end
    puts "\n"
    counter = 0
    o.board.each_with_index do |v, i|
        v.each_with_index do |k, i|
            if i == 0 
                print " #{counter} #{k.to_s}"
                counter += 1   
            elsif i == o.end_point
                print "#{k.to_s} \n"
            else
                print "#{k.to_s}"
            end
        end
    end
end

def hit_or_miss(new_board_cpu, replyrow, replycol)
    if new_board_cpu.board[replyrow.to_i][replycol.to_i].content.class == Ship
        return new_board_cpu.board[replyrow.to_i][replycol.to_i].content.ship_status
    else
        return "Miss!"
    end
end

def end_game(new_board, new_board_cpu)
    player_place = 0
    cpu_place = 0
    new_board.board.each do |row|
        row.each do |cell|
            if cell.status == "X"
                player_place += 1
            end
        end
    end

    new_board_cpu.board.each do |row|
        row.each do |cell|
            if cell.status == "X"
                cpu_place += 1
            end
        end
    end

    if cpu_place == 14
       return  "A Winner is you!"
    elsif player_place == 14
        return "They Saken your Battle Ships "
    else 
       return true
    end
end
    
    def show_opp_board(new_board_cpu)
        show_board(new_board_cpu)
    end
    
    def begin_game(new_board, new_board_cpu, cpu)
        intro = {ship1: "Destroyer = 2", ship2: "Submarine = 3", ship3: "Cruiser = 4", ship4: "Battle Ship = 5"} 
        show_opp_board(new_board_cpu); show_board(new_board)
        intro.each_value do |v|
            p v
        end
    
        intro.each do |k, v|
            while true
                puts "What row would you want to place the #{v}?"; replyrow = gets.chomp.to_i
                puts "What column would you want to place the #{v}";replycol = gets.chomp.to_i
                puts "Do you want your #{v} to be vertical or horizontal?"; replyvert = gets.chomp    
                if new_board.main(Ship.new(v[-1].to_i,"(#{v[0]})"), replyrow, replycol, replyvert) != "Invalid Placement!"
                    system('cls')
                    show_opp_board(new_board_cpu); show_board(new_board)
                    break
                end
            end
        end
        cpu.deploy_opp_ships()
    
     
        new_board.board.each do |row|
            row.each do |cell|
                while true
                    puts "what row would you like to fire at?"; replyrow = gets.chomp
                    puts "what column would you like to fire at?"; replycol = gets.chomp
                    if replyrow.gsub(/\D/, "").length > 0 && replycol.gsub(/\D/, "").length > 0
                        if new_board_cpu.atk_cell(replyrow.to_i, replycol.to_i) != 'invalid shot'
                        p hit_or_miss(new_board_cpu, replyrow, replycol)
                        break
                    end
                end
            end
                #    sleep(3)
                if end_game(new_board, new_board_cpu) != true
                    break
                end
            spot = new_board.pick_open_cell()
            new_board.atk_cell(spot[0], spot[1])
            system('cls')
            show_opp_board(new_board_cpu); show_board(new_board)
            if end_game(new_board, new_board_cpu) != true
                break
            end
            
            puts "The CPU has Fired a shot !!"
            puts "Fire your shot!"
        end
        if end_game(new_board, new_board_cpu) != true
            break
        end
    end
    if end_game(new_board, new_board_cpu) != true
        puts end_game(new_board, new_board_cpu)
    end
end
    # win_func()
    # begin_game(new_board, new_board_cpu, cpu)
    