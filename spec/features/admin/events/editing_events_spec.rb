require 'spec_helper'

feature "Editing an event" do
	let!(:admin_user) { create(:admin_user) }
	let!(:event) { create(:event) }

	before do
		sign_in_as!(admin_user)
		visit '/'
		click_link "Admin"
		click_link "News & Events"
		click_link event.title
		click_link "Edit Event"
	end

	scenario "Updating an event's details" do
		fill_in "Title", with: "Edited Event Title"
		click_button "Update Event"

		expect(page).to have_content("Event has been updated.")

		within("#events") do
			expect(page).to have_content("Edited Event Title")
			expect(page).to_not have_content(event.title)
		end
	end

	scenario "Updating an event with invalid attributes" do
		fill_in "Title", with: ""
		click_button "Update Event"

		expect(page).to have_content("Event has not been updated.")
	end

	scenario "Updating an event with a start date in the past" do
		fill_in "Start Date", with: "2013-09-03 00:00:00"
		click_button "Update Event"

		expect(page).to have_content("Event has not been updated.")
	end
end