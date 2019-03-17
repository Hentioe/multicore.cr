# multicore

Multi-process launch of Crystal app

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     multicore:
       github: Hentioe/multicore.cr
   ```

2. Run `shards install`

## Usage

```` crystal
require "multicore"

def start
  process_id = ENV["MULTICORE_ID"]?
  puts "Starting process: #{process_id}" if process_id
  sleep
end

Multicore.startup(4) do
  start
end

# => Starting process: 1
# => Starting process: 2
# => Starting process: 3
# => Starting process: 4
````

The meaning of the first parameter `n` of `Multicore#startup`:

* `n < 0`, No fork new process, nothing happens
* `n == 0`, The number of processes is the number of CPUs
* `n > 0`, Specify the number of processes

## Contributing

1. Fork it (<https://github.com/Hentioe/multicore.cr.git>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

* [Hentioe](https://github.com/Hentioe) - creator and maintainer
