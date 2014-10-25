require 'grape'
require File.expand_path('../../container/container.rb', __FILE__)

module API
  class ContainerStatusAPI < Grape::API
    desc 'list'
    get :list do
      {containers: Container.status_list}
    end

    desc 'status'
    params do
      requires :name, type: String
    end
    get :status do
      exist_check! params[:name]
      container = Container.new(params[:name])
      container.status
    end
  end
end
