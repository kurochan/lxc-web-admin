require 'grape'
require File.expand_path('../../container/container.rb', __FILE__)

module API
  class ContainerAPI < Grape::API
    desc 'list'
    get :list do
      {containers: Container.list}
    end
  
    desc 'start'
    params do
      requires :name, type: String
    end
    get :start do
      exist_check!(params[:name])
      container = Container.new(params[:name])
      container.start
      {msg: "success"}
    end
  
    desc 'stop'
    params do
      requires :name, type: String
    end
    get :stop do
      exist_check!(params[:name])
      container = Container.new(params[:name])
      container.stop
      {msg: "success"}
    end
  
    desc 'freeze'
    params do
      requires :name, type: String
    end
    get :freeze do
      exist_check!(params[:name])
      container = Container.new(params[:name])
      container.freeze
      {msg: "success"}
    end
  
    desc 'unfreeze'
    params do
      requires :name, type: String
    end
    get :unfreeze do
      exist_check!(params[:name])
      container = Container.new(params[:name])
      container.unfreeze
      {msg: "success"}
    end
  
    desc 'create'
    params do
      requires :name, type: String
      requires :template, type: String
    end
    get :create do
      exist_check!(params[:template])
      not_exist_check!(params[:name])
  
      container = Container.new(params[:template])
      container.clone(params[:name])
      {msg: "success"}
    end
  
    desc 'update'
    params do
      requires :name, type: String
    end
    get :update do
      exist_check!(params[:name])
    end
  
    desc 'destroy'
    params do
      requires :name, type: String
    end
    get :destroy do
      exist_check!(params[:name])
    end
  end
end
