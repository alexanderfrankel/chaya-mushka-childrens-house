require 'spec_helper'

describe Faculty::PostsController do
	let(:user) { create(:user) }
	let(:faculty_user) { create(:faculty_user) }

	context "standard users" do
		before do
			sign_in(user)
		end

		{ new: :get,
		  create: :post,
		  edit: :get,
		  update: :put,
		  destroy: :delete }.each do |action, method|
		  	it "cannot access the #{action} action" do
		  		send(method, action, :id => create(:post))
		  		expect(response).to redirect_to(root_path)
		  		expect(flash[:alert]).to eql("You must be faculty to do that.")
		  	end
		  end
	end

	context "faculty users" do
		before do
			sign_in(faculty_user)
		end

		it "displays an error for a missing post" do
			get :show, id: "not-here"

			expect(response).to redirect_to(faculty_posts_path)
			message = "The post you were looking for could not be found."
			expect(flash[:alert]).to eql(message)
		end
	end
end