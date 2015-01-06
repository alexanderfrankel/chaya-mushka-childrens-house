class HomepageController < ApplicationController
	def index
		@upcoming_events = Event.upcoming_events
	end
end