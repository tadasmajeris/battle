require 'sinatra/base'
require './lib/player'
require './lib/attack'
require './lib/heal'

class Battle < Sinatra::Base

enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    player1 = Player.new(params[:player1_name])
    player2 = Player.new(params[:player2_name])
    automate = params[:player2_name].empty?
    @game = Game.create(player1, player2, automate)
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
    @action_message = Attack.use(@game.defender)
    @player = @game.defender
    @game.end_game? ? redirect('/end_game') : erb(:action)
  end

  get '/auto_attack' do
    Attack.use(@game.defender)
    redirect('/end_game') if @game.end_game?
    @game.switch_turn
    Attack.use(@game.defender)
    @game.end_game? ? redirect('/end_game') : erb(:auto_attack)
  end

  get '/heal' do
    @action_message = Heal.use(@game.attacker)
    @player = @game.attacker
    erb(:action)
  end

  get '/end_game' do
    erb(:end_game)
  end

  run! if app_file == $0
end
