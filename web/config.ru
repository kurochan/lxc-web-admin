require './web'

use Rack::Session::Cookie
run Rack::Cascade.new [Web]
