require 'grape'
require File.expand_path('../helper/api_helpers.rb', __FILE__)
require File.expand_path('../container_api.rb', __FILE__)
require File.expand_path('../container_status_api.rb', __FILE__)

module API
  class API < Grape::API
    prefix 'api'
    version 'v1', using: :path
    format :json
    helpers ApiHelpers
    resource :container do
      mount ContainerAPI
      resource :status do
        mount ContainerStatusAPI
      end
    end
  
    desc 'health check'
    get :hc do
      {status: 'OK'}
    end
  end
end
