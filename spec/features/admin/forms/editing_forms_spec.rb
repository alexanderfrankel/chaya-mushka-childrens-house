require 'spec_helper'

feature "Editing a form" do
	let!(:admin_user) { create(:admin_user) }
	let!(:form) { create(:form) }

	before do
		sign_in_as!(admin_user)
		visit '/'
		click_link "Admin"
		click_link "Forms"
		click_link form.title
		click_link "Edit Form"
	end

	scenario "Updating a form's details" do
		fill_in "Title", with: "Edited Form Title"
		click_button "Update Form"

		expect(page).to have_content("Form has been updated.")

		within("#forms") do
			expect(page).to have_content("Edited Form Title")
			expect(page).to_not have_content(form.title)
		end
	end

	scenario "Updating a form with invalid attributes" do
		fill_in "Description", with: ""
		click_button "Update Form"

		expect(page).to have_content("Form has not been updated.")
	end
end