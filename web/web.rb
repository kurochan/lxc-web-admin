require 'sinatra'
require 'sinatra/reloader' if development?

class Web < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :dashboard
  end
end
