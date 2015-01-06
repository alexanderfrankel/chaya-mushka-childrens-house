class Admin::TuitionsController < Admin::BaseController
	before_action :set_tuition, only: [:show, :edit, :update]

	def index
		@tuitions = Tuition.all
	end

	def new
		@tuition = Tuition.new
	end

	def create
		@tuition = Tuition.new(tuition_params)
		@tuition.user = current_user

		if @tuition.save
			flash[:notice] = "Tuition information has been saved."
			redirect_to admin_tuitions_path
		else
			flash[:alert] = "Tuition information has not been saved."
			render "new"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @tuition.update(tuition_params)
			flash[:notice] = "Tuition information has been updated."
			redirect_to [:admin, @tuition]
		else
			flash[:alert] = "Tuition information has not been updated."
			render "edit"
		end
	end

	private

	def set_tuition
		@tuition = Tuition.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The tuition information you were looking for could not be found."
		redirect_to admin_tuitions_path
	end

	def tuition_params
		params.require(:tuition).permit(:year, :amount, :current)
	end
end