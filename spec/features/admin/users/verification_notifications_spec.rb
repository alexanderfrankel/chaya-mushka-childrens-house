require 'spec_helper'

feature "Verification Notifications" do
	let!(:admin_user) { create(:admin_user) }
	let!(:unverified_user) { create(:unverified_user) }

	before do
		ActionMailer::Base.deliveries.clear

		sign_in_as!(admin_user)
		visit '/'
		click_link "Admin"
		click_link "Users"
	end

	scenario "Unverified User receives notification of verification" do
		click_link "#{unverified_user.last_name}, #{unverified_user.first_name}"
		click_link "Verify User"

		expect(page).to have_content("User has been verified. A notification email has been sent to #{unverified_user.email}.")

		email = find_email!(unverified_user.email)
		subject = "Chaya Mushka Children's House Preschool Account Verification"
		email.subject.should include(subject)
		click_first_link_in_email(email)

		expect(page).to have_content("Sign In")
	end
end