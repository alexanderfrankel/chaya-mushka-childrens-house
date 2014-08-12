class Admin::EventsController < Admin::BaseController
	def index
		@events = Event.order(:start_date)
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)

		if @event.save
			flash[:notice] = "Event has been added."
			redirect_to admin_events_path
		else
			flash[:alert] = "Event has not been added."
			render "new"
		end
	end

	private

	def event_params
		params.require(:event).permit(:title, :description, :start_date, :end_date)
	end

	def set_event
		@event = Event.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The event you were looking for could not be found."
		redirect_to admin_events_path
	end
end