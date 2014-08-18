class Admin::FormsController < Admin::BaseController
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

	private

	def form_params
		params.require(:form).permit(:title, :description, :url)
	end
end