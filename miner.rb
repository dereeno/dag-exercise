require './dag.rb'

class Miner

	attr_reader :id, :dag, :propagation_delay
	attr_accessor :peers

	def initialize(id:, genesis_block:)
		@id = id
		@dag = DAG.new(self, genesis_block)
		@peers = []
		puts "Miner ##{@id} started with genesis block #{genesis_block.id}"
	end

	def create_block
		dag.create_block
	end

	def next_block
		block = create_block
		propogate_block_to_peers(block)
	end

	def propogate_block_to_peers(block)
		peers.each do |peer|
			Thread.new do
				sleep(random_propagation_delay)
				peer.add_block(block)
			end
		end
	end

	def random_propagation_delay
		random_delay = @@propagation_delay * rand(-0.1...0.1)
		@@propagation_delay + random_delay
	end

	def add_block(block)
		dag.add_block(block)
	end
end
