require 'spec_helper'

describe Admin::UsersController do
	let(:user) { create(:user) }
	let(:faculty_user) { create(:faculty_user) }
	let(:admin_user) { create(:admin_user) }

	context "standard users" do
		before { sign_in(user) }

		{ new: :get,
		  create: :post,
		  edit: :get,
		  update: :put }.each do |action, method|
		  	it "cannot access the #{action} action" do
		  		send(method, action, :id => create(:user))
		  		expect(response).to redirect_to(root_path)
		  		expect(flash[:alert]).to eql("You must be an admin to do that.")
		  	end
		  end
	end

	context "faculty users" do
		before { sign_in(faculty_user) }

		{ new: :get,
		  create: :post,
		  edit: :get,
		  update: :put }.each do |action, method|
		  	it "cannot access the #{action} action" do
		  		send(method, action, :id => create(:user))
		  		expect(response).to redirect_to(root_path)
		  		expect(flash[:alert]).to eql("You must be an admin to do that.")
		  	end
		  end
	end

	context "admin users" do
		before do
			sign_in(admin_user)
		end

		it "displays an error for a missing user" do
			get :show, id: "not-here"

			expect(response).to redirect_to(admin_users_path)
			message = "The user you were looking for could not be found."
			expect(flash[:alert]).to eql(message)
		end
	end
end