require 'sinatra/base'

class Battle < Sinatra::Base

  get '/' do
    "Hello battling people!"
  end

  run! if app_file == $0
end
