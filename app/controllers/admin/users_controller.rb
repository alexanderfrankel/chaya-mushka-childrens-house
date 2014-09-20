class Admin::UsersController < Admin::BaseController
	before_action :set_user, only: [:show, :edit, :update, :destroy, :verify]

	def index
		@unverified_users = User.find_unverified.order(last_name: :asc)
		@admin_users = User.find_admin.order(last_name: :asc)
		@faculty_users = User.find_faculty.order(last_name: :asc)
		@parent_users = User.find_parent.order(last_name: :asc)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.administrator = current_user

		if @user.save
			flash[:notice] = "User has been created."
			redirect_to admin_users_path
		else
			flash.now[:alert] = "User has not been created."
			render "new"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:notice] = "User has been updated."
			redirect_to admin_users_path
		else
			flash[:alert] = "User has not been updated."
			render "edit"
		end
	end

	def destroy
		if @user == current_user
			flash[:alert] = "You cannot delete yourself!"
		else
			@user.destroy
			flash[:notice] = "User has been deleted."
		end

		redirect_to admin_users_path
	end

	private

	def set_user
		@user = User.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The user you were looking for could not be found."
		redirect_to admin_users_path
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :shutterfly_url, :faculty, :admin)
	end
end