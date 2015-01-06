require 'spec_helper'

describe FormsController do
	it "displays an error for a missing form" do
		get :show, id: "not-here"

		expect(response).to redirect_to(forms_path)
		message = "The form you were looking for could not be found."
		expect(flash[:alert]).to eql(message)
	end
end