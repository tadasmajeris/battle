require 'sinatra/base'
require "player"

class Battle < Sinatra::Base
	enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $player1 = Player.new(params[:player_1_name])
    $player2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  post '/attack_player_2' do
  	session[:last_move] = "#{$player1.name} attacked #{$player2.name}!"
  	redirect '/play'
  end

  get '/play' do
  	@name1 = $player1.name
  	@name2 = $player2.name
  	@last_move = session[:last_move]
  	erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
