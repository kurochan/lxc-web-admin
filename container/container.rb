require 'lxc'
require 'parallel'

class Container < LXC::Container
  def self.list
    LXC::list_containers
  end

  def self.status_list
    Parallel.map(LXC::list_containers) do |name|
      container = Container.new(name)
      container._status
    end
  end

  def self.exists?(name)
    LXC::list_containers.include?(name)
  end

  def status
    Parallel.map([nil]) do
      _status
    end[0]
  end

  def _status
    {
      name: name,
      hostname: name,
      status: state,
      ip_addrs: ip_addresses,
      cpu_usage: cpu_usage,
      memory_usage: memory_usage,
      autostart: autostart?
    }
  end

  def cpu_usage
    state == :running ?
      cgroup_item('cpuacct.usage') : 0
  end

  def memory_usage
    state == :running ?
      cgroup_item('memory.usage_in_bytes') : 0
  end
  
  def ip_addresses
    state == :running ? super : []
  end

  def autostart?
    config_item('lxc.start.auto') == '1'
  end
end
