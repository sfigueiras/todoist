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

	def date_and_time(date)
		{date: date.strftime("%d/%m/%Y"), time:  date.strftime("%I:%M%p")}
	end
end
