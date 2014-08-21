require 'spec_helper'

describe TuitionsController do
	it "displays an error for a missing tuition" do
		get :show, id: "not-here"

		expect(response).to redirect_to(tuitions_path)
		message = "The tuition information you were looking for could not be found."
		expect(flash[:alert]).to eql(message)
	end
end