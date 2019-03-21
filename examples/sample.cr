require "../src/multicore"

def start
  process_id = ENV["MULTICORE_ID"]?
  puts "Starting process: #{process_id}" if process_id
  sleep
end

Multicore.startup(4) do
  start
end
