require "./multicore/**"

module Multicore
  VERSION = "0.1.1"

  def self.startup(n, &block)
    if n < 0
      yield
    else
      n = n != 0 ? n : LibC.sysconf(LibC::SC_NPROCESSORS_ONLN)
      if Cluster.master?
        (1..n).each do |i|
          Cluster.fork ({"MULTICORE_ID" => i.to_s})
        end
        sleep
      else
        yield
      end
    end
  end
end
