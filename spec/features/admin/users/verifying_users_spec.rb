require 'spec_helper'

feature "Verifying Users" do

	let!(:admin_user) { create(:admin_user) }
	let!(:unverified_user) { create(:unverified_user) }

	before do
		sign_in_as!(admin_user)
		visit '/'
		click_link "Admin"
		click_link "Users"
	end

	scenario "Verify a User" do
		within("#unverified_users") do
			click_link "#{unverified_user.last_name}, #{unverified_user.first_name}"
		end

		click_link "Verify User"
		expect(page).to have_content("User has been verified. A notification email has been sent to #{unverified_user.email}.")

		within("#users") do
			expect(page).to have_content("#{unverified_user.last_name}, #{unverified_user.first_name}")
		end
	end

end