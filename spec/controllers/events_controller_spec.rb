require 'spec_helper'

describe EventsController do
	it "displays an error for a missing event" do
		get :show, id: "not-here"

		expect(response).to redirect_to(events_path)
		message = "The event you were looking for could not be found."
		expect(flash[:alert]).to eql(message)
	end
end