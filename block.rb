class Block

	attr_accessor :parents
	attr_reader :id

	@@index = 0
	@@lock = Mutex.new


	def initialize(parents: [])
		@parents = parents
		@@lock.synchronize { @id = next_block_id }
	end

	private
	def abc_array
		['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
	end

	def next_block_id
		id = abc_array[@@index % 26]
		@@index += 1
		id
	end
end
