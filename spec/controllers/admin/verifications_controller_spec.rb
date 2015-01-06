require 'spec_helper'

describe Admin::VerificationsController do
	let(:user) { create(:user) }
	let(:faculty_user) { create(:faculty_user) }
	let(:admin_user) { create(:admin_user) }

	context "standard users" do
		before { sign_in(user) }

  	it "cannot access the verify user action" do
  		get :new, :user_id => create(:user)
  		expect(response).to redirect_to(root_path)
  		expect(flash[:alert]).to eql("You must be an admin to do that.")
  	end
	end

	context "faculty users" do
		before { sign_in(faculty_user) }

		it "cannot access the verify user action" do
			get :new, :user_id => create(:user)
			expect(response).to redirect_to(root_path)
			expect(flash[:alert]).to eql("You must be an admin to do that.")
		end
	end

	context "admin users" do
		before { sign_in(admin_user) }

		it "displays an error for a missing user" do
			get :new, user_id: "not-here"

			expect(response).to redirect_to(admin_users_path)
			message = "The user you were looking for could not be found."
			expect(flash[:alert]).to eql(message)
		end
	end
end