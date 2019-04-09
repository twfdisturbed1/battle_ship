require 'sinatra'
require_relative 'board.rb'
require_relative 'ship.rb'
require_relative 'cell.rb'
require_relative 'cpu.rb'
require_relative "cpu_cell.rb"
# require_relative 'end_game.rb'
# require_relative "game.rb"
use Rack::Session::Pool

get '/' do
  erb :index, :layout => :layout
end

get '/index' do
  erb :index, :layout => :layout
end

post '/index' do
  redirect '/size'
end

get '/faq' do
  erb :faq, :layout => :layout
end

get '/winner' do
  erb :winner, :layout => :layout
end

get '/loser' do
  erb :loser, :layout => :layout
end

get '/contact' do
  erb :contact, :layout => :layout
end

get '/rules' do
  erb :rules, :layout => :layout
end

post '/load' do
end

get '/size' do
  erb :size, :layout => :layout
end

post '/size' do
  session.clear
  # p "params in size post are #{params}"
  session[:board] = Board.new(params[:boardsize].to_i, "player1")
  session[:cpuboard] = Board.new(params[:boardsize].to_i, "cpu")
  session[:cpu] = Cpu.new(session[:cpuboard], session[:board])
  session[:err] = ""
  session[:shot_error] = ""

  redirect '/game'
end


get '/game' do
  hitter = session[:hitter] || ""
  # p "hitter in game get is #{hitter}"
  shot = session[:shot_fire] || ""
  # p "shot in game get is #{shot}"
  board = session[:board] 
  max_num = session[:max_num] 
  cpu = session[:cpu]
  cpuboard = session[:cpuboard] 
  ship_num = session[:increase] || 0
  row = session[:row].to_i || 0
  col = session[:col].to_i || 0
  pos = session[:pos].to_s || ""

  if session[:increase] == 4
    redirect '/fire_shots'
  end

  p "params in game get are #{params}"
  erb :game, locals: {board: board, cpuboard: cpuboard, hitter: hitter, row: row, col: col, pos: pos, ship_num: ship_num, err: session[:err], shot_error: session[:shot_error], max_num: session[:max_num], cpu: cpu}
end


post '/game' do
  session[:err] = ""
  session[:shot_fire] = ""
  session[:shot_error] = ""
  session[:ship_place_num]
  session[:increase] = params[:ship_num].to_i
  session[:row] = params[:row]
  session[:col] = params[:col]
  session[:pos] = params[:pos]
  p "params in game post are #{params}"
  ships = [battle_ship = Ship.new(5, "(B)"), cruiser = Ship.new(4, "(C)"), submarine = Ship.new(3, "(S)"), destroyer = Ship.new(2, "(D)")]
  # p "rows are #{session[:row]} col is #{session[:col]} and pos is #{session[:pos]}"
        if session[:board].main(ships[session[:increase]],params[:row].to_i, params[:col].to_i, params[:pos].to_s) != "Not a valid move"
          session[:place_ship] = ships[session[:increase]]
          session[:increase] += 1
          # p " Bill Session increase #{session[:increase]}"
          # p " Bill Session Board #{session[:board]}"
            if session[:increase] == 4
              session[:cpu].deploy_opp_ships()
            #   session[:cpuboard].board.each do |v|
            #     v.each do |x|
            #       if x != "~~"
            #     p "William space =  #{x.status}"
            #       end
            #     end
            #   end

            end
        else
          session[:err] = "Not a valid move"
        end
  redirect '/game'
end




get '/fire_shots' do
  p "params in fire_shots get are #{params}"
  max_num = session[:max_num] 
  hitter = session[:hitter] || ""
  player_score = session[:increase_ps] || 0
  cpu_score = session[:increase_cs] || 0
  # p "hitter in fire_shots get is #{hitter}"
  shot = session[:shot_fire] || ""
  # p "shot in fire_shots get is #{shot}"
  board = session[:board] 
  cpu = session[:cpu]
  cpuboard = session[:cpuboard] 
  row = session[:row].to_i || 0
  col = session[:col].to_i || 0
  

  erb :fire_shots, locals: {board: session[:board], cpuboard: session[:cpuboard], cpu: cpu, row: row, col: col, err: session[:err], shot_error: session[:shot_error], max_num: session[:max_num]}
end

post '/fire_shots' do
  # p "params in fire_shots post are #{params}"
  session[:shot_error] = ""
  session[:row] = params[:row]
  session[:col] = params[:col]
  session[:increase_ps] = params[:player_score].to_i
  session[:increase_cs] = params[:cpu_score].to_i
  def end_game(board, cpuboard)
    player_place = 0
    cpu_place = 0
    winner = " "
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
      redirect '/winner'  
      return  "A Winner is you! yes"
        @winner = "A Winner is you!"
     elsif player_place == 14
      redirect '/loser'
         return "They Saken your Battle Ships "
         @winner = "They Saken your Battle Ships "
        else 
        return ""
     end
 end
#   end_game(session[:board], session[:cpuboard])
#  p session[:winner]
#   if session[:winner] == "A Winner is you!" 
#   redirect '/winner'
#   elsif session[:winner] == "They Saken your Battle Ships "
#     redirect '/loser'
#   else
#   end
  # p "row in fire_shots post are #{session[:row]} and columns are #{session[:col]}"
# p session[:cpuboard].atk_cell(session[:row].to_i, session[:col].to_i)
# p "params in fire post #{params}"

      # session[:board].board.each do |v|
      #   v.each do |x|
      #     if x.status == "X"
      #   session[:increase_ps] += 1
      #     end
      #   end
      # end

      # session[:cpuboard].board.each do |v|
      #   v.each do |x|
      #     if x.status == "O"
      #   session[:increase_cs] += 1
      #     end
      #   end
      # end
# p session[:player_score]
#       if session[:player_score] == 14
#         redirect '/winner'
#       elsif session[:cpu_score] == 14
#         redirect '/loser'
#       end
      
  spot = session[:board].pick_open_cell()
      if session[:cpuboard].atk_cell(session[:row].to_i, session[:col].to_i) != "Not a valid move" 
      session[:board].atk_cell(spot[0], spot[1])
      # p session[:hitter]
      session[:hitter] = session[:cpuboard].hit_or_miss(session[:cpuboard], session[:row].to_i, session[:col].to_i)
      # p session[:hitter]
      # p session[:shot_error]
    else
      session[:shot_error] = "Not a valid move"

    end
  # end
   redirect '/fire_shots'
end
