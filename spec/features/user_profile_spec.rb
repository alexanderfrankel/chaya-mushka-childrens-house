require 'spec_helper'

feature "Profile Page" do
	let!(:user) { create(:user) }
	let!(:user2) { create(:user) }

	scenario "viewing when logged in" do
		sign_in_as!(user)
		visit '/'
		click_link "Profile"

		expect(page).to have_content(user.first_name)
		expect(page).to have_content(user.last_name)
	end

	scenario "viewing unauthorized profile" do
		sign_in_as!(user)
		visit user_path(user2)

		expect(page).to have_content("You do not have access. If you have recieved this message in error, please contact the administrative office.")
	end
end

feature "Editing Users" do
	let!(:user) { create(:user) }

	before do
		sign_in_as!(user)
	end

	scenario "Updating a user" do
		visit user_path(user)
		click_link "Edit Profile"

		fill_in "Email", with: "new_email@yo.com"
		click_button "Update Profile"

		expect(page).to have_content("Profile has been updated.")
	end

	scenario "Updating a user with invalid inputs" do
		visit user_path(user)
		click_link "Edit Profile"

		fill_in "Email", with: "invalid_email"
		click_button "Update Profile"

		expect(page).to have_content("Profile has not been updated.")
	end
end