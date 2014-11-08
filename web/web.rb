require 'sinatra'
require 'sinatra/reloader' if development?
require 'open-uri'
require 'json'
require File.expand_path('../config/config.rb', __FILE__)

class Web < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    json_text = open("#{CONFIG['server'][0]['endpoint']}/api/v1/container/status/list").read
    @containers = JSON.parser.new(json_text).parse['containers']
    erb :dashboard
  end
end
