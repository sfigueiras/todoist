class TemporaryTask < Task
	validate :end_date_greater
	after_initialize :default_values

	def end_date_greater
		if self.end_date < self.start_date
			errors.add(:invalid_date, "start date can't be greater than end date")
		end
	end

	def self.model_name
		Task.model_name
	end

	private

	def default_values
		self.start_date ||= Date.current
		self.end_date ||= Date.tomorrow.tomorrow
	end
end
