module SessionQueue
	extend ActiveSupport::Concern

	def push(element)
		session[:top] = (session[:top] || []) << element
	end

	def pop(element)
		session[:top].reject! {|e| e.eql? element } if session[:top]
	end

	def all
		session[:top]
	end
end