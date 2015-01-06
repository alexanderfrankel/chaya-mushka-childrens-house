class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]
	before_action :authorize_user!, only: [:show, :edit, :update]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:notice] = "Successful sign up. Please wait for admin verification. You will receive an email when verification is complete!"
			redirect_to root_path
		else
			flash[:alert] = "Unsuccessful sign up. Please try again."
			render "new"
		end
	end

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
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end

	def set_user
		@user = User.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The user you were looking for could not be found."
		redirect_to root_path
	end

	def authorize_user!
	  require_signin!

	  if current_user.nil? == false
	    unless current_user == @user
	    	flash[:alert] = "You do not have access. If you have recieved this message in error, please contact the administrative office."
	    	redirect_to root_path
	    end
	  end
	end
end