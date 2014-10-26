require './api/api'
require './web/web'

use Rack::Session::Cookie
run Rack::Cascade.new [API::API, Web]
