require 'sinatra/base'

class Battle < Sinatra::Base
	enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    session[:name1] = params[:player_1_name]
    session[:name2] = params[:player_2_name]
    redirect '/play'
  end

  get '/play' do
  	@name1 = session[:name1]
  	@name2 = session[:name2]
  	erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
