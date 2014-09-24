class EventsController < ApplicationController
	before_action :set_event, only: :show

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

	def show
	end

	private

	def set_event
		@event = Event.find(params[:id])
	rescue ActiveRecord::RecordNotFound
			flash[:alert] = "The event you were looking for could not be found."
			redirect_to events_path
	end
end