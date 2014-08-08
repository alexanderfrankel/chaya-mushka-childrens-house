describe UsersController do
	it "displays an error for a missing user" do
		get :show, id: "not-here"

		expect(response).to redirect_to(root_path)
		message = "The user you were looking for could not be found."
		expect(flash[:alert]).to eql(message)
	end
end