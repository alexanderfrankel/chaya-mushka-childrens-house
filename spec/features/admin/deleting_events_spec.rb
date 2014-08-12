require 'spec_helper'

feature "Deleting events" do
	let!(:admin_user) { create(:admin_user) }
	let!(:event) { create(:event) }

	before do
		sign_in_as!(admin_user)
		visit '/'

		click_link "Admin"
		click_link "Events"
	end

	scenario "Deleting an event" do
		click_link event.title
		click_link "Delete Event"

		expect(page).to have_content("Event has been deleted.")
	end
end