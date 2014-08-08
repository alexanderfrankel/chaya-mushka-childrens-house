require 'spec_helper'

describe PostsController do
	let(:user) { create(:user) }

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
		  		sign_in(user)
		  		send(method, action, :id => create(:post))
		  		expect(response).to redirect_to(root_path)
		  		expect(flash[:alert]).to eql("You must be faculty to do that.")
		  	end
		  end


		it "cannot access the new action" do
			get :new

			expect(response).to redirect_to root_path
			expect(flash[:alert]).to eql("You must be faculty to do that.")
		end
	end

	it "displays an error for a missing post" do
		get :show, id: "not-here"

		expect(response).to redirect_to(posts_path)
		message = "The post you were looking for could not be found."
		expect(flash[:alert]).to eql(message)
	end
end