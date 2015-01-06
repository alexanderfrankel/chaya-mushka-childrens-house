require 'spec_helper'

feature "User Sign Up" do
	before do
		visit '/'
		click_link "Sign Up"
	end

	scenario "Signing Up a new user with valid attributes" do
		fill_in "First Name", with: "Newton"
		fill_in "Last Name", with: "New"
		fill_in "Email", with: "newton@new.com"
		fill_in "Password", with: "password"
		fill_in "Password Confirmation", with: "password"
		click_button "Sign Up"

		expect(page).to have_content("Successful sign up. Please wait for admin verification. You will receive an email when verification is complete!")
	end

	scenario "Signing Up a new user in invalid attributes" do
		fill_in "Last Name", with: "New"
		fill_in "Email", with: "newton@new.com"
		fill_in "Password", with: "password"
		fill_in "Password Confirmation", with: "password"
		click_button "Sign Up"

		expect(page).to have_content("Unsuccessful sign up. Please try again.")
	end
end