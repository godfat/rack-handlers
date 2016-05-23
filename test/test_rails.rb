
require_relative 'shared'

Pork::API.describe 'rails-server' do
  def run name, port, &block
    if get(name)
      pid = Process.spawn('rails', 's', name, '-p', port.to_s)
      sleep(1) # slow rails
      block.call(name)
      pid
    else
      block.call
    end
  end

  paste :shared
end

Pork.execute
Pork.stat.report
