require 'api.rb'
require 'web.rb'

use Rack::Session::Cookie
run Rack::Cascade.new [API::API, Web]
