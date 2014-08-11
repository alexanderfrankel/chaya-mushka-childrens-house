require 'spec_helper'

feature "Deleting users" do
	let!(:admin_user) { create(:admin_user) }
	let!(:user) { create(:user) }

	before do
		sign_in_as!(admin_user)
		visit '/'

		click_link "Admin"
		click_link "Users"
	end

	scenario "Deleting a user" do
		click_link "#{user.last_name}, #{user.first_name}"
		click_link "Delete User"

		expect(page).to have_content("User has been deleted.")
	end

	scenario "Users cannot delete themselves" do
		click_link "#{admin_user.last_name}, #{admin_user.first_name}"
		click_link "Delete User"

		expect(page).to have_content("You cannot delete yourself!")
	end

end