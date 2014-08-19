describe UsersController do

	context "User" do
		{ show: :get,
		  edit: :get,
		  update: :put }.each do |action, method|
		  	it "can access the #{action} action" do
		  		send(method, action, :id => create(:user))
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
		# { show: :get,
		#   edit: :get,
		#   update: :put }.each do |action, method|
		#   	it "cannot access the #{action} action" do
		#   		send(method, action, :id => create(:user))
		#   		expect(response).to redirect_to(root_path)
		#   		expect(flash[:alert]).to eql("You must be logged in as this user to do that.")
		#   	end
		#   end
	end
end