class TuitionsController < ApplicationController
	before_action :set_tuition, only: :show

	def index
		@tuitions = Tuition.all
	end

	def show
	end

	private

	def set_tuition
		@tuition = Tuition.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The tuition information you were looking for could not be found."
		redirect_to tuitions_path
	end
end