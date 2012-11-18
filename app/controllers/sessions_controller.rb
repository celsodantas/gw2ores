class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:email])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:notice] = "Logged!"
			redirect_to :root
		else
			flash[:notice] = "Sorry, but your email or password is not right. Try again."
			redirect_to action: :new
		end
	end

	def destroy
		session[:user_id] = nil

		flash[:notice] = "Logged out successfully."
		redirect_to :root
	end
end
