class SessionsController < ApplicationController
	before_action :check_user_verification, only: :create

	def new
	end

	def create
		user = User.where(:email => params[:signin][:email]).first
		if user && user.authenticate(params[:signin][:password])
			if params[:remember_me]
				cookies.permanent[:auth_token] = user.auth_token
			else
				cookies[:auth_token] = user.auth_token
			end
			flash[:notice] = "Signed in successfully."
			redirect_to root_url
		else
			flash[:error] = "Sorry. Your email or password is invalid."
			render :new
		end
	end

	def destroy
		cookies.delete(:auth_token)
		flash[:notice] = "Signed out successfully."

		redirect_to root_url
	end

	private

	def check_user_verification
		user = User.where(:email => params[:signin][:email]).first
		unless user.verified?
			flash[:error] = "Apologies. Your account has not yet been verified by the administrative office. Please wait for verification email."
			redirect_to root_url
		end
	end
end