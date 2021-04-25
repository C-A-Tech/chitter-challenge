require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/peeps'

class Chitter < Sinatra::Base
  configure :developement do
    register Sinatra::Reloader
  end

  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  get '/compose/peep' do
    erb :compose_peep
  end

  post '/' do
    peep = params['message']
    Peeps.new(peep)
    redirect('/')
  end

  run! if app_file == $0
end