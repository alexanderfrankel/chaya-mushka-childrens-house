require 'spec_helper'

describe Admin::UsersController do
	let(:user) { create(:user) }
	let(:faculty_user) { create(:faculty_user) }

	context "standard users" do
		before { sign_in(user) }

		it "are not able to access the index action" do
			get 'index'
			expect(response).to redirect_to('/')
			expect(flash[:alert]).to eql("You must be an admin to do that.")
		end
	end

	context "faculty users" do
		before { sign_in(faculty_user) }

		it "are not able to access the index action" do
			get 'index'
			expect(response).to redirect_to('/')
			expect(flash[:alert]).to eql("You must be an admin to do that.")
		end
	end
end