require './network.rb'

Network.new(miner_count: 10, block_count: 10, creation_rate: 1, propagation_delay: 3).run
