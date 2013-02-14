module ApplicationHelper
	def logged?
		session[:user_id] != nil
  	end
end
