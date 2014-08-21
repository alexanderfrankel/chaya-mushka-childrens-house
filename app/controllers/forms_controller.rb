class FormsController < ApplicationController
	before_action :set_form, only: :show

	def index
		@forms = Form.all
	end

	def show
	end

	private

	def set_form
		@form = Form.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The form you were looking for could not be found."
		redirect_to forms_path
	end
end