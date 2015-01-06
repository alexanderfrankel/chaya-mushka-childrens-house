require 'spec_helper'

feature "Viewing Events" do
	let!(:event) { create(:event) }

	before do
		visit '/'
		click_link "News & Events"
	end

	scenario "viewing all events" do
		expect(page).to have_content("News & Events")

		# within("#events") do
		# 	expect(page).to have_content(event.title)
		# end
	end

	scenario "viewing an individual event" do
		# click_link event.title

		# expect(page).to have_content(event.title)
		# expect(current_url).to eql(event_url(event))
	end
end