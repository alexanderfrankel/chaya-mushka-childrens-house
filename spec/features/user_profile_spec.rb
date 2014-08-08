require 'spec_helper'

feature "Profile Page" do
	scenario "viewing" do
		user = create(:user)

		visit user_path(user)

		expect(page).to have_content(user.first_name)
		expect(page).to have_content(user.last_name)
	end
end

feature "Editing Users" do
	scenario "Updating a user" do
		user = create(:user)

		visit user_path(user)
		click_link "Edit Profile"

		fill_in "Email", with: "new_email@yo.com"
		click_button "Update Profile"

		expect(page).to have_content("Profile has been updated.")
	end

	scenario "Updating a user with invalid inputs" do
		user = create(:user)

		visit user_path(user)
		click_link "Edit Profile"

		fill_in "Email", with: "invalid_email"
		click_button "Update Profile"

		expect(page).to have_content("Profile has not been updated.")
	end
end