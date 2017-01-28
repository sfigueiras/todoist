class TemporaryTask < Task
	validate :end_date_greater
	after_initialize :default_values
	validate :end_date, :not_expired

	def end_date_greater
		if self.end_date < self.start_date
			errors.add(:invalid_date, "start date can't be greater than end date")
		end
	end

	def not_expired
		if self.end_date < Date.current
			errors.add(:task_expired, "task can't be modified because it has expired")
		end
	end

	def self.model_name
		Task.model_name
	end

	def reschedule
		self.end_date = Date.current
	end

	private

	def default_values
		self.start_date ||= Date.current
		self.end_date ||= Date.tomorrow.tomorrow
	end
end
