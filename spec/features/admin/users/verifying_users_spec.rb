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

	scenario "View all unverified users" do
		within("#unverified_users") do
			expect(page).to have_content("#{unverified_user.last_name}, #{unverified_user.first_name}")
		end
	end

end