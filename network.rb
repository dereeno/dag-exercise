require './miner.rb'

class Network

  attr_reader :miners, :block_count, :creation_rate, :propagation_delay

  def initialize(miner_count:, block_count:, creation_rate:, propagation_delay:)
    @block_count = block_count

    @miners = []
    genesis_block = Block.new(parents: [])

    # Creating miner_count miners (miner ID starts from 1)
    for i in 1..miner_count
      @miners << Miner.new(id: i, genesis_block: genesis_block)
    end

    # Adding peers to each miner (all miners for now)
    for i in 0..miner_count - 1
      @miners[i].peers = @miners - [@miners[i]]
    end

    @creation_rate = creation_rate
    Miner.class_variable_set(:@@propagation_delay, propagation_delay)
  end

  def run
    block_count.times do
      miner = choose_random_miner
      miner.next_block
      sleep(creation_rate)
    end
  end

  def choose_random_miner
    miners.sample
  end
end
