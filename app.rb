require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'

class Battle < Sinatra::Base
	enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player1 = Player.new(params[:player_1_name])
    player2 = Player.new(params[:player_2_name])
    $game = Game.new(player1,player2)
    redirect '/play'
  end

  post '/attack' do
  	session[:last_move] = $game.attack_current_target
  	redirect '/switch_turns'
  end

  get '/switch_turns' do
    $game.switch
    redirect '/play'
  end

  get '/play' do
  	@last_move = session[:last_move]
  	@game = $game
  	erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
