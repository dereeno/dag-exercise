require './block.rb'
class DAG

	attr_accessor :tips
	attr_reader :lock, :miner

	def initialize(miner, genesis_block)
		@tips = [genesis_block]
		@lock = Mutex.new
		@miner = miner
	end

	def add_block(block)
		lock.synchronize do
			@tips = @tips + [block] - block.parents
			puts "Miner ##{miner.id} added block #{block.id} to his DAG with parents #{block.parents.map(&:id)}"
		end
		block
	end

	def create_block
		block = Block.new(parents: random_parents_for_new_block)
		puts "Miner ##{miner.id} created block #{block.id}"
		add_block(block)
	end

	def random_parents_for_new_block
		# choosing a random integer 0 < random_number_of_parents < tips.length
		random_number_of_parents = rand(tips.length) + 1
		tips.sample(random_number_of_parents)
	end
end
