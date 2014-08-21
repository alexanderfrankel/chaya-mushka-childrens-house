class StaffController < ApplicationController
	before_action :set_staff_member, only: :show

	def index
		@staff = User.where(faculty: true)
	end

	def show
	end

	private

	def set_staff_member
		@staff_member = User.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The staff member you were looking for could not be found."
		redirect_to staff_index_path
	end
end