require 'grape'
require File.expand_path('../container_job.rb', __FILE__)
require File.expand_path('../../container/container.rb', __FILE__)

module API
  class ContainerJobAPI < Grape::API
    desc 'list'
    get :list do
      jobs = ContainerJob.jobs.map {|job| {status: job.status, message: job.message, time: job.time}}
      {jobs: jobs}
    end
  end
end
