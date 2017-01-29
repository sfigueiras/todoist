class TemporaryTask < Task
	before_save :default_values
	before_save :end_date_greater
	before_save :not_expired

	def end_date_greater
		p "Called end_date_greater"
		if self.end_date < self.start_date
			errors.add(:invalid_date, "start date can't be greater than end date")
			throw(:abort)
		end
	end

	def not_expired
		p "Calling not_expired"
		if self.end_date < Date.current
			errors.add(:task_expired, "task can't be modified because it has expired")
			throw(:abort)
		end
	end

	def self.model_name
		Task.model_name
	end

	def reschedule
		self.end_date = Date.current
		save(validate: false)
	end

	private

	def default_values
		p "Called default_values"
		self.start_date ||= Date.current
		self.end_date ||= Date.tomorrow.tomorrow
	end
end
