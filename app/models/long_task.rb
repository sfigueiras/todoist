class LongTask < Task
	validates :progress, inclusion: { in: (0..100) }
	# after_initialize :default_values
	
	def self.model_name
		Task.model_name
	end

	def default_values
		self.progress = 0
	end
end
