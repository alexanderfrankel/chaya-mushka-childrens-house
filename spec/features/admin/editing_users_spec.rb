require 'spec_helper'

feature "Editing a user" do
	let!(:admin_user) { create(:admin_user)}
	let!(:user) { create(:user) }

	before do
		sign_in_as!(admin_user)
		visit '/'
		click_link "Admin"
		click_link "Users"
		click_link "#{user.last_name}, #{user.first_name}"
		click_link "Edit User"
	end

	scenario "Updating a user's details" do
		fill_in "Last Name", with: "Newlastname"
		click_button "Update User"

		expect(page).to have_content("User has been updated.")

		within("#users") do
			expect(page).to have_content("Newlastname")
			expect(page).to_not have_content(user.last_name)
		end
	end

	scenario "Toggling user's admin ability" do
		check "Admin?"
		click_button "Update User"

		expect(page).to have_content("User has been updated.")

		within("#users") do
			expect(page).to have_content("#{user.last_name}, #{user.first_name} (Admin)")
		end
	end

	scenario "Toggling user's faculty ability" do
		check "Faculty?"
		click_button "Update User"

		expect(page).to have_content("User has been updated.")

		within("#users") do
			expect(page).to have_content("#{user.last_name}, #{user.first_name} (Faculty)")
		end
	end
end