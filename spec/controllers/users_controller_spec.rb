require 'spec_helper'

describe UsersController do
	let!(:user) { create(:user) }
	let!(:user2) { create(:user) }

	before do
		sign_in(user)
	end

	context "User" do
		{ show: :get,
		  edit: :get }.each do |action, method|
		  	it "can access the #{action} action" do
		  		send(method, action, :id => user)
		  		expect(response.status).to eq(200)
		  	end
		  end

		it "displays an error for a missing user" do
			get :show, id: "not-here"

			expect(response).to redirect_to(root_path)
			message = "The user you were looking for could not be found."
			expect(flash[:alert]).to eql(message)
		end
	end

	context "Anonymous" do
		{ show: :get,
		  edit: :get }.each do |action, method|
		  	it "cannot access the #{action} action" do
		  		send(method, action, :id => user2)
		  		expect(response).to redirect_to(root_path)
		  		expect(flash[:alert]).to eql("You do not have access. If you have recieved this message in error, please contact the administrative office.")
		  	end
		  end
	end
end