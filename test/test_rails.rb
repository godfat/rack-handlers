
require_relative 'shared'

Pork::API.describe Rack::Handler do
  def run name, &block
    if get(name)
      pid = Process.spawn('rails', 's', name, '-p', '8080')
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
