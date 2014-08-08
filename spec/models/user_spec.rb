require 'spec_helper'

describe User do
	describe "passwords" do
		it "needs a password and confirmation to save" do
			u = User.new(first_name: "steve", last_name: "cool", email: "steve@cool.com")

			u.save
			expect(u).to_not be_valid

			u.password = "password"
			u.password_confirmation = " "
			u.save
			expect(u).to_not be_valid

			u.password_confirmation = "password"
			u.save
			expect(u).to be_valid
		end

		it "needs password and confirmation to match" do
			u = User.create(first_name: "steve", last_name: "cool", email: "steve@cool.com", password: "hunter2", password_confirmation: "hunter")
			expect(u).to_not be_valid
		end
	end

	describe "authentication" do
		let(:user) { User.create(first_name: "steve", last_name: "cool", email: "steve@cool.com", password: "hunter2", password_confirmation: "hunter2")}

		it "authenticates with a correct password" do
			expect(user.authenticate("hunter2")).to be
		end

		it "does not authenticate with an incorrect password" do
			expect(user.authenticate("hunter1")).to_not be
		end
	end
end