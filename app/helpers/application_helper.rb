module ApplicationHelper
	def minumum_lists_added?
		session[:top] && session[:top].size > 4
	end

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
