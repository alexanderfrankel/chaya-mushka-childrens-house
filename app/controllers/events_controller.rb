class EventsController < ApplicationController
	before_action :authorize_admin!, except: [:index, :show]
	before_action :set_event, only: [:show, :edit, :update, :destroy]

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
			redirect_to events_path
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
			redirect_to events_path
		else
			flash[:alert] = "Event has not been updated."
			render "edit"
		end
	end

	def destroy
		@event.destroy

		flash[:notice] = "Event has been deleted."
		redirect_to events_path
	end

	private

	def event_params
		params.require(:event).permit(:title, :description, :start_date, :end_date)
	end

	def set_event
		@event = Event.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The event you were looking for could not be found."
		redirect_to events_path
	end
end