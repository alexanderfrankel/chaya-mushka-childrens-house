class PasswordResetsController < ApplicationController
	before_action :set_user, only: [:edit, :update]

	def new
	end

	def create
		user = User.find_by_email(params[:email])
		user.send_password_reset if user
		flash[:notice] = "Email sent with password reset instructions."
		redirect_to root_url
	end

	def edit
	end

	def update
		if @user.password_reset_sent_at < 2.hours.ago
			flash[:alert] = "Password reset has expired."
			redirect_to new_password_reset_path
		elsif @user.update(user_params)
			flash[:notice] = "Password has been updated."
			redirect_to root_url
		else
			flash[:alert] = "Password has not been updated. Please try again."
			render "edit"
		end
	end

	private

	def user_params
		params.require(:user).permit(:password, :password_confirmation)
	end

	def set_user
		@user = User.find_by_password_reset_token(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The user you were looking for could not be found."
		redirect_to root_url
	end
end