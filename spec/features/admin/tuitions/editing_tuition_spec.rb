require 'spec_helper'

feature "Editing Tuition Information" do
	let!(:admin_user) { create(:admin_user) }
	let!(:tuition) { create(:tuition, current: false) }

	before do
		sign_in_as!(admin_user)
		visit '/'
		click_link "Admin"
		click_link "Tuition"
		click_link tuition.year
		click_link "Edit Tuition Information"
	end

	scenario "Updating the tuition amount" do
		fill_in "Amount", with: 1000
		click_button "Update"

		expect(page).to have_content("Tuition information has been updated.")
		expect(page).to have_content("Amount: $1000")
		expect(page).to_not have_content(tuition.amount)
	end

	scenario "Updating non-current tuition to current tuition" do
		check "Current?"
		click_button "Update"

		expect(page).to have_content("Tuition information has been updated.")

		visit admin_tuitions_path
		within("#tuitions") do
			expect(page).to have_content("#{tuition.year} (Current)")
		end
	end
end