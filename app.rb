require 'sinatra/base'
require './lib/player'

class Battle < Sinatra::Base

  enable :sessions

  before { @game = Game.instance }

  get '/' do
    erb(:index)
  end

  post '/names' do
    player1 = Player.new(params[:player1_name])
    player2 = Player.new(params[:player2_name])
    Game.create(player1, player2)
    redirect '/play'
  end

  get '/play' do
    erb(:play)
  end

  get '/attack' do
    @game.attack(@game.target_player)
    @game.over? ? redirect('/game_over') : erb(:attack)
  end

  post '/attack' do
    @game.switch
    redirect '/play'
  end

  get '/game_over' do
    erb(:game_over)
  end

  run! if app_file == $0
end
