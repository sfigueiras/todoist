module ApplicationHelper
	def title(page_title)
	    content_for(:title) { page_title }
	  end
	  
	def format_date(date)
		date.strftime("%D")
	end

	def updated_at(date)
		{date: date.strftime("%m/%d/%Y"), time:  date.strftime("%I:%M%p")}
	end
end
