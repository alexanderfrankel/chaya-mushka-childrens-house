require 'spec_helper'

feature "Viewing Tuitions" do
	let!(:tuition) { create(:current_tuition) }

	before do
		visit '/'
		click_link "Tuition Information"
	end

	scenario "all tuitions" do
		expect(page).to have_content("Tuition Information")

		within("#tuitions") do
			expect(page).to have_content("#{tuition.year} (Current)")
		end
	end

	scenario "for an individual year" do
		click_link tuition.year

		expect(page).to have_content(tuition.year)
		expect(current_url).to eql(tuition_url(tuition))
	end
end