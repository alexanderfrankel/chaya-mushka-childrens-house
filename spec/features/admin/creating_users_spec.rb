require 'spec_helper'

feature "Creating Users" do
	let!(:admin) { create(:admin_user) }

	before do
		sign_in_as!(admin)
		visit '/'
		click_link "Admin"
		click_link "Users"
		click_link "New User"
	end

	scenario "Creating a new user" do
		fill_in "First Name", with: "Newton"
		fill_in "Last Name", with: "New"
		fill_in "Email", with: "newton@new.com"
		fill_in "Password", with: "password"
		fill_in "Password Confirmation", with: "password"
		fill_in "Shutterfly URL", with: "www.shutterfuly.com"
		click_button "Create User"

		expect(page).to have_content("User has been created.")
	end

	scenario "Creating an admin user" do
		fill_in "First Name", with: "Admin"
		fill_in "Last Name", with: "New"
		fill_in "Email", with: "admin@new.com"
		fill_in "Password", with: "password"
		fill_in "Password Confirmation", with: "password"
		check "Admin?"
		click_button "Create User"

		expect(page).to have_content("User has been created.")
		within("#users") do
			expect(page).to have_content("admin@new.com (Admin)")
		end
	end

	scenario "Creating a faculty user" do
		fill_in "First Name", with: "Faculty"
		fill_in "Last Name", with: "New"
		fill_in "Email", with: "faculty@new.com"
		fill_in "Password", with: "password"
		fill_in "Password Confirmation", with: "password"
		check "Faculty?"
		click_button "Create User"

		expect(page).to have_content("User has been created.")
		within("#users") do
			expect(page).to have_content("faculty@new.com (Faculty)")
		end
	end
end