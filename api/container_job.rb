class ContainerJob < Proc
  attr_reader :message, :status, :time

  @@jobs = []

  def self.jobs
    @@jobs
  end

  def initialize(msg = '')
    super()
    @status = 'pending'
    @message = msg
    @time = 0
    @@jobs << self
  end

  def call(*arg)
    @status = 'running'
    start_time = Time.now
    counter = Thread.start {loop {
      @time = (Time.now - start_time).to_i
      sleep 1
    }}
    begin
      super
      @status = 'finished'
    rescue => e
      @message += (e.message)
      @status = 'failed'
    end
    counter.kill
  end
end
