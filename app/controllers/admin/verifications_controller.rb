class Admin::VerificationsController < Admin::BaseController
	before_action :set_user

	def new
		@user.verify_user
		flash[:notice] = "User has been verified. A notification email has been sent to #{@user.email}."
		redirect_to admin_users_path
	end

	private

	def set_user
		@user = User.find(params[:user_id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The user you were looking for could not be found."
		redirect_to admin_users_path
	end
end