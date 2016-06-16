
require_relative 'shared'

Pork::API.describe 'rails-server' do
  def detect name
    str = if RUBY_ENGINE == 'jruby'
            get(name).to_s
          else
            rd, wr = IO.pipe
            pid = fork do
              wr.puts(get(name))
              wr.close
            end
            result = rd.gets.chomp
            rd.close
            Process.waitpid(pid)
            result
          end

    str != ''
  end

  def run name, port, &block
    if detect(name)
      pid = Process.spawn('rails', 's', name,
                                   '-p', port.to_s,
                                   '-C', 'config/environment.rb')
      sleep(1) # slow rails
      block.call(name)
      pid
    else
      block.call
    end
  end

  paste :shared
end
