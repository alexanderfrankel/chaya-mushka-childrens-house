class Admin::EventsController < Admin::BaseController
	before_action :set_event, only: [:show, :edit, :update, :destroy]

	def index
		calendar_event_data = []

				Event.all.each do |event|
					calendar_event_data << { id: event.id,
																		title: event.title,
																		description: event.description,
																		start_date: event.start_date,
																		end_date: event.end_date }
				end

				@calendar_event_data_json = calendar_event_data.to_json.html_safe
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		@event.user = current_user

		if @event.save
			flash[:notice] = "Event has been added."
			redirect_to admin_events_path
		else
			flash[:alert] = "Event has not been added."
			render "new"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @event.update(event_params)
			flash[:notice] = "Event has been updated."
			redirect_to admin_events_path
		else
			flash[:alert] = "Event has not been updated."
			render "edit"
		end
	end

	def destroy
		@event.destroy

		flash[:notice] = "Event has been deleted."
		redirect_to admin_events_path
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