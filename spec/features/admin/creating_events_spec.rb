require 'spec_helper'

feature "Creating Events" do

	let(:admin_user) { create(:admin_user) }

	before do
		sign_in_as!(admin_user)
		visit '/'
		click_link "Admin"
		click_link "News & Events"
		click_link "Add Event"
	end

	scenario "can add an event" do
		fill_in "Title", with: "Example Event"
		fill_in "Description", with: "Example description"
		fill_in "Start Date", with: "2015-09-03 00:00:00"
		fill_in "End Date", with: "2015-09-03 02:00:00"
		click_button "Add Event"

		expect(page).to have_content("Event has been added.")
	end

	scenario "can not add an event without a title" do
		click_button "Add Event"

		expect(page).to have_content("Event has not been added.")
		expect(page).to have_content("Title can't be blank")
	end

	scenario "can not create an event without a start date" do
		fill_in "Title", with: "Example Event"
		fill_in "Description", with: "Example description"
		fill_in "End Date", with: "2015-09-03 02:00:00"
		click_button "Add Event"

		expect(page).to have_content("Event has not been added.")
		expect(page).to have_content("Start Date can't be blank")
	end

	scenario "can not create an event without an end date" do
		fill_in "Title", with: "Example Event"
		fill_in "Description", with: "Example description"
		fill_in "Start Date", with: "2015-09-03 00:00:00"
		click_button "Add Event"

		expect(page).to have_content("Event has not been added.")
		expect(page).to have_content("End Date can't be blank")
	end

	scenario "can not create an event with a start date or end date in the past" do
		fill_in "Title", with: "Example Event"
		fill_in "Description", with: "Example description"
		fill_in "Start Date", with: "2013-09-03 00:00:00"
		fill_in "End Date", with: "2013-09-03 02:00:00"
		click_button "Add Event"

		expect(page).to have_content("Event has not been added.")
		expect(page).to have_content("Start Date can't be in the past")
		expect(page).to have_content("End Date can't be in the past")
	end

	scenario "can not create an event with an end date that does not come after the start date" do
		fill_in "Title", with: "Example Event"
		fill_in "Description", with: "Example description"
		fill_in "Start Date", with: "2015-10-03 00:00:00"
		fill_in "End Date", with: "2015-09-03 02:00:00"
		click_button "Add Event"

		expect(page).to have_content("Event has not been added.")
		expect(page).to have_content("End Date must come after the Start Date")
	end
end