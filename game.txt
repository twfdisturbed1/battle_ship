require_relative "ship.rb"
require_relative "cell.rb"
require_relative "board.rb"
require_relative "enemy_cell.rb"
require_relative "enemy.rb"
puts "what level of difficulty do you choose? easy[e], hard[h], difficult[d]"
answer = gets.chomp
system('cls')
if answer == "e"
   o = Grid.new(12, "player"); m = Grid.new(12, "ai"); ai = Enemy.new(m, o)
elsif answer == "h"
   o = Grid.new(24,"player"); m = Grid.new(24, "ai"); ai = Enemy.new(m, o)
else
   o = Grid.new(36, "player"); m = Grid.new(36, "ai"); ai = Enemy.new(m, o)
end

def show_board(o)
    countertop = 0
    print "  "
    o.grid.each_with_index do |v, i|
        if countertop < 10
        print "  #{countertop}"
        countertop += 1
        else print " #{countertop}"
            countertop += 1
        end 
    end
    puts "\n"
    counter = 0
    o.grid.each_with_index do |v, i|
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

def show_opp_board(m)
    show_board(m)
end

def hit_or_miss(m, replyrow, replycol)
    if m.grid[replyrow.to_i][replycol.to_i].content.class == Ship
        return m.grid[replyrow.to_i][replycol.to_i].content.ship_status
    else
        return "Miss!"
    end
end

def game_ender(o, m)
    player_spots = 0
    ai_spots = 0
    o.grid.each do |row|
        row.each do |cell|
            if cell.status == "X"
                player_spots += 1
            end
        end
    end

    m.grid.each do |row|
        row.each do |cell|
            if cell.status == "X"
                ai_spots += 1
            end
        end
    end

    if ai_spots == 14
       return  "You Win!"
    elsif player_spots == 14
        return "You Lose"
    else 
       return true
    end
end

def begin_game(o, m, ai)
    intro = {ship1: "Carrier = 5", ship2: "Battleship = 4", ship3: "cruiser = 3", ship4: "Submarine = 2"} 
    show_opp_board(m); show_board(o)
    intro.each_value do |v|
        p v
    end

    intro.each do |k, v|
        while true
            puts "What row would you want to place the #{v}?"; replyrow = gets.chomp.to_i
            puts "What column would you want to place the #{v}";replycol = gets.chomp.to_i
            puts "would you like to place the ship vertical or horizontal?"; replyvert = gets.chomp
            if o.mastor_funk(Ship.new(v[-1].to_i,"(#{v[0]})"), replyrow, replycol, replyvert) != "Invalid Placement!"
                system('cls')
                show_opp_board(m); show_board(o)
                break
            end
        end
    end
    ai.deploy_opp_ships()


    o.grid.each do |row|
        row.each do |cell|
            while true
                puts "what row would you like to fire at?"; replyrow = gets.chomp
                puts "what column would you like to fire at?"; replycol = gets.chomp
                if replyrow.gsub(/\D/, "").length > 0 && replycol.gsub(/\D/, "").length > 0
                    if m.atk_cell(replyrow.to_i, replycol.to_i) != 'invalid shot'
                        p hit_or_miss(m,replyrow, replycol)
                        break
                    end
                end
            end
                sleep(3)
                if game_ender(o, m) != true
                    break
                end
            spot = o.pick_open_cell()
            o.atk_cell(spot[0], spot[1])
            system('cls')
            show_opp_board(m); show_board(o)
            if game_ender(o, m) != true
                break
            end
            
            puts "look at your grid! the enemy has fired"
            puts "--------------------------------------"
            puts "now your turn!"
        end
        if game_ender(o, m) != true
            break
        end
    end
    if game_ender(o, m) != true
        puts game_ender(o, m)
    end
end
# win_func()
begin_game(o, m, ai)

