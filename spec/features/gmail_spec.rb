require 'spec_helper'

feature "Gmail" do
	let!(:me) { create(:unverified_user, email: "alexxander.frankel@gmail.com") }
	let!(:admin_user) { create(:admin_user) }

	before do
		ActionMailer::Base.delivery_method = :smtp
	end


	scenario "Receiving an account verification email" do
		sign_in_as!(admin_user)
		visit '/'
		click_link "Admin"
		click_link "Users"
		click_link "#{me.last_name}, #{me.first_name}"
		click_link "Verify User"
		page.should have_content("User has been verified. A notification email has been sent to #{me.email}.")

		chaya_mushka_emails.count.should == 1
		email = chaya_mushka_emails.first
		subject = "Chaya Mushka Children's House Preschool Account Verification"
		email.subject.should == subject
		clear_chaya_mushka_emails!
	end

	scenario "Receiving a forgot password email" do
		visit '/'
		click_link "Sign In"
		click_link "Forgot Password"
		fill_in "Email", with: me.email
		click_button "Reset Password"
		page.should have_content("Email sent with password reset instructions.")

		chaya_mushka_emails.count.should == 1
		email = chaya_mushka_emails.first
		subject = "Chaya Mushka Children's House Preschool Password Reset"
		email.subject.should == subject
		clear_chaya_mushka_emails!
	end

	after do
		ActionMailer::Base.delivery_method = :test
	end
end