require 'spec_helper'

describe StaffController do
	it "displays an error for a missing staff member" do
		get :show, id: "not-here"

		expect(response).to redirect_to(staff_index_path)
		message = "The staff member you were looking for could not be found."
		expect(flash[:alert]).to eql(message)
	end
end