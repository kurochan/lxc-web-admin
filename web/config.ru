require 'web.rb'

use Rack::Session::Cookie
run Rack::Cascade.new [Web]
