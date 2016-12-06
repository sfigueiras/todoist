module ApplicationHelper
	def format_date(date)
		date.strftime("%D")
	end

	def updated_at(date)
		{date: date.strftime("%m/%d/%Y"), time:  date.strftime("%I:%M%p")}
	end
end
