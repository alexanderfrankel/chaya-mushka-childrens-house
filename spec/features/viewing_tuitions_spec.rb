require 'spec_helper'

feature "Viewing Tuitions" do
	let!(:tuition) { create(:current_tuition) }

	before do
		visit '/'
		click_link "Tuition Information"
	end

	scenario "current tuition" do
		expect(page).to have_content(tuition.year)
		expect(current_url).to eql(tuitions_url)
	end
end