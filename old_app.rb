require 'sinatra'
require_relative 'board.rb'
require_relative 'ship.rb'
require_relative 'cell.rb'
require_relative 'cpu.rb'
require_relative "cpu_cell.rb"
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

session[:board] = Board.new(params[:boardsize].to_i, "player1")
session[:cpuboard] = Board.new(params[:boardsize].to_i, "cpu")
session[:cpu] = Cpu.new(session[:cpuboard], session[:board])
session[:err] = ""
session[:shot_error] = ""
redirect '/game'
end


get '/game' do
  hitter = session[:hitter] || ""
  shot = session[:shot_fire] || ""
  board = session[:board] 
  max_num = session[:max_num] 
  cpu = session[:cpu]
  cpuboard = session[:cpuboard] 
  ship_num = session[:increase] || 0
  row = session[:row].to_i || 0
  col = session[:col].to_i || 0
  pos = session[:pos].to_s || ""

  # if session[:err] != "Not a valid move" and ship_num <= 3
  #   board.main(session[:place_ship], row, col, pos) if pos != "" 
  # end
  
  # if shot == "Missle launched"
  #   session[:cpu].deploy_opp_ships()
  # end

  if session[:increase] == 4
    ship_num += 1
  end

  erb :game, locals: {board: board, cpuboard: cpuboard, hitter: hitter, row: row, col: col, pos: pos, ship_num: ship_num, err: session[:err], shot_error: session[:shot_error], max_num: session[:max_num], cpu: cpu}
end

post '/game' do
  session[:err] = ""
  session[:shot_fire] = ""
  session[:shot_error] = ""
  session[:ship_place_num]
  # session[:cpu] = params[:cpu]
  session[:increase] = params[:ship_num].to_i
  session[:row] = params[:row]
  session[:col] = params[:col]
  session[:pos] = params[:pos]
  ships = [battle_ship = Ship.new(5, "(B)"), cruiser = Ship.new(4, "(C)"), submarine = Ship.new(3, "(S)"), destroyer = Ship.new(2, "(D)")]

  if session[:board].main(ships[session[:increase]],session[:row].to_i, session[:col].to_i, params[:pos].to_s) != "Not a valid move"
    session[:place_ship] = ships[session[:increase]]
    session[:increase] += 1
    p " Bill Session increase #{session[:increase]}"
    p " Bill Session Board #{session[:board]}"
    session[:shot_fire] = "Missle Launched"  if session[:increase] == 4  
    else
    session[:err] = "Not a valid move"
  end
  if session[:increase] == 2
    session[:cpu].deploy_opp_ships()
    session[:cpuboard].board.each do |v|
      v.each do |x|
        if x != "~~"
      p "William space =  #{x.status}"
        end
      end
  end
end


  spot = session[:board].pick_open_cell()
  if session[:increase] > 4
    if session[:cpuboard].atk_cell(session[:row].to_i, session[:col].to_i) == "Not a valid shot" 
      session[:board].atk_cell(spot[0], spot[1])
      p session[:hitter]
      session[:hitter] = hit_or_miss(session[:cpuboard], session[:row].to_i, session[:col].to_i)
      p session[:hitter]
    else
      session[:shot_error] = "Not a valid shot"

    end
  end

   redirect '/game'
end
