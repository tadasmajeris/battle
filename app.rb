require 'sinatra/base'
require './lib/player'
require './lib/attack'

class Battle < Sinatra::Base

enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    player1 = Player.new(params[:player1_name])
    player2 = Player.new(params[:player2_name])
    @game = Game.create(player1, player2)
    redirect '/play'
  end

  before do
    @game = Game.instance
  end

  get '/play' do
    erb(:play)
  end

  post '/switch' do
    @game.switch_turn
    redirect '/play'
  end

  get '/attack' do
    Attack.use(@game.defender)
    @game.end_game? ? redirect('/end_game') : erb(:attack)
  end

  get '/end_game' do
    erb(:end_game)
  end

  run! if app_file == $0
end
