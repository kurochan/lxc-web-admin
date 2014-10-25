require 'api.rb'

use Rack::Session::Cookie
run Rack::Cascade.new [API::API]
