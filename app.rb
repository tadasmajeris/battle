require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'

class Battle < Sinatra::Base
	enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $player1 = Player.new(params[:player_1_name])
    $player2 = Player.new(params[:player_2_name])
    $game = Game.new
    redirect '/play'
  end

  post '/attack_player_2' do
  	session[:last_move] = $game.attack($player1, $player2)
  	redirect '/play'
  end

  get '/play' do
  	@player1 = $player1
  	@player2 = $player2
  	@last_move = session[:last_move]
  	erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
