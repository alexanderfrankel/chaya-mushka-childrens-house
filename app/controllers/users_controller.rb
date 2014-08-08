class UsersController < ApplicationController
	before_action :set_user

	def show
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:notice] = "Profile has been updated."
			redirect_to @user
		else
			flash[:alert] = "Profile has not been updated."
			render "edit"
		end
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :shutterfly_url)
	end

	def set_user
		@user = User.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The user you were looking for could not be found."
		redirect_to root_path
	end
end