require './api/api.rb'
require './web/web.rb'

use Rack::Session::Cookie
run Rack::Cascade.new [API::API, Web]
