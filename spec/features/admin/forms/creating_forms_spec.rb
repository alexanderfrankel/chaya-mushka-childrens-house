require 'spec_helper'

feature "Creating Forms" do
	let!(:admin) { create(:admin_user) }

	before do
		sign_in_as!(admin)
		visit '/'
		click_link "Admin"
		click_link "Forms"
		click_link "New Form"
	end

	scenario "Creating a form" do
		fill_in "Title", with: "New Form"
		fill_in "Description", with: "This is my new form."
		click_button "Add Form"

		expect(page).to have_content("Form has been added.")
		within("#forms") do
			expect(page).to have_content("New Form")
		end
	end

	scenario "can not create a form without a title" do
		fill_in "Description", with: "This is my new form."
		click_button "Add Form"

		expect(page).to have_content("Form has not been added.")
		expect(page).to have_content("Title can't be blank")
	end
end