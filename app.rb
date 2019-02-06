require 'sinatra'
require_relative 'board.rb'
require_relative 'ship.rb'
require_relative 'cell.rb'
require_relative 'cpu.rb'
require_relative "cpu_cell.rb"
require_relative "game.rb"
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
redirect '/game'
end


get '/game' do
  board = session[:board] 
  max_num = session[:max_num] 
  cpuboard = session[:cpuboard] 
  ship_num = session[:increase] || 0
  row = session[:row].to_i || 0
  col = session[:col].to_i || 0
  pos = session[:pos].to_s || ""
  if session[:err] != "Invalid Placement!"
    board.main(session[:place_ship], row, col, pos) if pos != "" 
  end
  
  if session[:increase] == 4
    session[:cpu].deploy_opp_ships()
  end
  erb :game, locals: {board: board, cpuboard: cpuboard, row: row, col: col, pos: pos, ship_num: ship_num, err: session[:err], max_num: session[:max_num]}
end

post '/game' do
  session[:err] = ""
  session[:increase] = params[:ship_num].to_i
  session[:row] = params[:row]
  session[:col] = params[:col]
  session[:pos] = params[:pos]
  ships = [carrier = Ship.new(5, "(C)"), battleship = Ship.new(4, "(B)"), cruiser = Ship.new(3, "(c)"), submarine = Ship.new(2, "(S)")]
  if session[:board].main(ships[session[:increase]],params[:row].to_i, params[:col].to_i, params[:pos].to_s) != "Invalid Placement!"
    session[:place_ship] = ships[session[:increase]]
    session[:increase] += 1
  else
    session[:err] = "Invalid Placement!"
  end
  session[:cpuboard].atk_cell(params[:row].to_i, params[:col].to_i)

  if session[:increase] >= 4
    if session[:cpuboard].atk_cell(params[:row].to_i, params[:col].to_i) == "Invalid Shot!" 
      session[:fire_err] = "Invalid Shot!"
    end
  end
  hit_or_miss(session[:cpuboard], params[:row].to_i,  params[:col].to_i )
  end_game(session[:board], session[:cpuboard])
  

  
  redirect '/game'
end



# board = session[:board]
# cpuboard = session[:cpuboard]