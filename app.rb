require 'sinatra/base'
require './lib/player'

class Battle < Sinatra::Base

  enable :sessions

  before { @game = Game.instance }

  get '/' do
    erb(:index)
  end

  post '/names' do
    player2_name = params[:player2_name].empty? ? :computer : params[:player2_name]
    player1 = Player.new(params[:player1_name])
    player2 = Player.new(player2_name)
    Game.create(player1, player2)
    redirect '/play'
  end

  get '/play' do
    erb(:play)
  end

  get '/attack' do
    @last_move = @game.attack_current_target
    @target_hp = @game.target_hp
    redirect('/game_over') if @game.over?

    if @game.auto?
      @game.switch
      @next_move = @game.attack_current_target
      @next_hp = @game.target_hp
    end

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
