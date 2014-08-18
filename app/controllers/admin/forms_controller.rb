class Admin::FormsController < Admin::BaseController
	before_action :set_form, only: [:show, :edit, :update, :destroy]

	def index
		@forms = Form.all
	end

	def new
		@form = Form.new
	end

	def create
		@form = Form.new(form_params)

		if @form.save
			flash[:notice] = "Form has been added."
			redirect_to admin_forms_path
		else
			flash[:alert] = "Form has not been added."
			render "new"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @form.update(form_params)
			flash[:notice] = "Form has been updated."
			redirect_to admin_forms_path
		else
			flash[:alert] = "Form has not been updated."
			render "edit"
		end
	end

	private

	def form_params
		params.require(:form).permit(:title, :description, :url)
	end

	def set_form
		@form = Form.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The form you were looking for could not be found."
		redirect_to admin_forms_path
	end
end