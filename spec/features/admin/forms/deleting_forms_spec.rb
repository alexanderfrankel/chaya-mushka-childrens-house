require 'spec_helper'

feature "Deleting forms" do
	let!(:admin_user) { create(:admin_user) }
	let!(:form) { create(:form) }

	before do
		sign_in_as!(admin_user)
		visit '/'
		click_link "Admin"

		within('#admin-menu') do
			click_link "Forms"
		end
	end

	scenario "Deleting a form" do
		click_link form.title
		click_link "Delete Form"

		expect(page).to have_content("Form has been deleted.")
	end
end