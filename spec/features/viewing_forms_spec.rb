require 'spec_helper'

feature "Viewing Forms" do
	let!(:form) { create(:form) }

	before do
		visit '/'
		click_link "Forms"
	end

	scenario "all forms" do
		expect(page).to have_content("Forms")

		within("#forms") do
			expect(page).to have_content(form.title)
		end
	end

	scenario "individual form" do
		click_link form.title

		expect(page).to have_content(form.title)
		expect(current_url).to eql(form_url(form))
	end
end