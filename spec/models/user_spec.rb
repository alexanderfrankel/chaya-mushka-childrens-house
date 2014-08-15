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

	it "requires an email" do
		u = User.new(first_name: "alex",
								 last_name: "frank",
								 password: "password",
								 password_confirmation: "password")

		u.save
		expect(u).to_not be_valid

		u.email = "alex@frank.com"
		u.save
		expect(u).to be_valid
	end

	it "requires a first name" do
		u = User.new(last_name: "frank",
								 email: "frank@noname.com",
								 password: "password",
								 password_confirmation: "password")

		u.save
		expect(u).to_not be_valid

		u.first_name = "Alex"
		u.save
		expect(u).to be_valid
	end

	it "requires a last name" do
		u = User.new(first_name: "alex",
								 email: "alex@noname.com",
								 password: "password",
								 password_confirmation: "password")

		u.save
		expect(u).to_not be_valid

		u.last_name = "Frank"
		u.save
		expect(u).to be_valid
	end

	describe "admin users" do
		it "must also be a faculty user" do
			u = User.new(first_name: "alex",
									 last_name: "frank",
								 	 email: "alex@noname.com",
								 	 password: "password",
								 	 password_confirmation: "password",
								 	 admin: true)

			u.save
			expect(u).to_not be_valid

			u.faculty = true
			u.save
			expect(u).to be_valid
		end
	end
end