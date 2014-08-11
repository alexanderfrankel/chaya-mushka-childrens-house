class Admin::UsersController < Admin::BaseController
	def index
		@users = User.order(:email)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:notice] = "User has been created."
			redirect_to admin_users_path
		else
			flash.now[:alert] = "User has not been created."
			render "new"
		end
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :shutterfly_url, :faculty, :admin)
	end
end