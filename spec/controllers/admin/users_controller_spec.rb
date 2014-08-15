require 'spec_helper'

describe Admin::UsersController do
	let(:user) { create(:user) }
	let(:faculty_user) { create(:faculty_user) }

	context "standard users" do
		before { sign_in(user) }

		{ new: :get,
		  create: :post,
		  edit: :get,
		  update: :put,
		  destroy: :delete }.each do |action, method|
		  	it "cannot access the #{action} action" do
		  		send(method, action, :id => create(:post))
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
		  update: :put,
		  destroy: :delete }.each do |action, method|
		  	it "cannot access the #{action} action" do
		  		send(method, action, :id => create(:post))
		  		expect(response).to redirect_to(root_path)
		  		expect(flash[:alert]).to eql("You must be an admin to do that.")
		  	end
		  end
	end
end