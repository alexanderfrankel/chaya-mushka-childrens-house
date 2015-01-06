require 'spec_helper'

feature "Forgot Password" do

	let!(:user) { create(:user) }

	before do
		ActionMailer::Base.deliveries.clear

		visit '/'
		click_link "Sign In"
		click_link "Forgot Password"
		fill_in "Email", with: user.email
		click_button "Reset Password"
	end

	scenario "Receive password reset email" do
		expect(page).to have_content("Email sent with password reset instructions.")

		email = find_email!(user.email)
		subject = "Chaya Mushka Children's House Preschool Password Reset"
		email.subject.should include(subject)
		click_first_link_in_email(email)

		expect(page).to have_content("Reset Password")
	end

	scenario "Reset password using link in email with valid password" do
		email = find_email!(user.email)
		click_first_link_in_email(email)

		fill_in "Password", with: "newpassword"
		fill_in "Password Confirmation", with: "newpassword"
		click_button "Update Password"

		expect(page).to have_content("Password has been updated.")

		click_link "Sign In"
		fill_in "Email", with: user.email
		fill_in "Password", with: "newpassword"
		click_button "Sign In"

		expect(page).to have_content("Signed in successfully.")
	end

	scenario "Reset password using link in email with invalid password" do
		email = find_email!(user.email)
		click_first_link_in_email(email)

		fill_in "Password", with: "newpassword"
		fill_in "Password Confirmation", with: "oldpassword"
		click_button "Update Password"

		expect(page).to have_content("Password has not been updated.")
	end
end