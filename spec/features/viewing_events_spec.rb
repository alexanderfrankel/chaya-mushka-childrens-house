require 'spec_helper'

feature "Viewing Events" do
	scenario "Listing all events" do
		event = create(:event)

		visit '/'
		click_link event.title
		expect(page.current_url).to eql()
	end
end