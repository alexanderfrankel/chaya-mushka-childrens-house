require 'spec_helper'

feature "Creating Tuitions" do
	let!(:admin) { create(:admin_user) }

	before do
		sign_in_as!(admin)
		visit '/'
		click_link "Admin"
		click_link "Tuition"
		click_link "Add Tuition Year"
	end

	scenario "Creating a current tuition year" do
		fill_in "Year", with: "2015 - 2016"
		fill_in "Amount", with: 2000
		check "Current?"
		click_button "Save Tuition Information"

		expect(page).to have_content("Tuition information has been saved.")
		within("#tuitions") do
			expect(page).to have_content("2015 - 2016 (Current)")
		end
	end

	scenario "Creating a non-current tuition year" do
		fill_in "Year", with: "2016 - 2017"
		fill_in "Amount", with: 3000
		click_button "Save Tuition Information"

		expect(page).to have_content("Tuition information has been saved.")
		within("#tuitions") do
			expect(page).to_not have_content("2016 - 2017 (Current)")
		end
	end

	scenario "cannot create a tuition year without a year" do
		fill_in "Amount", with: 3000
		click_button "Save Tuition Information"

		expect(page).to have_content("Tuition information has not been saved.")
		expect(page).to have_content("Year can't be blank")
	end

	scenario "cannot create a tuition year without an amount" do
		fill_in "Year", with: "2016 - 2017"
		click_button "Save Tuition Information"

		expect(page).to have_content("Tuition information has not been saved.")
		expect(page).to have_content("Amount can't be blank")
	end

	scenario "cannot create a tuition year with an amount less than 0" do
		fill_in "Year", with: "2016 - 2017"
		fill_in "Amount", with: -2
		click_button "Save Tuition Information"

		expect(page).to have_content("Tuition information has not been saved.")
		expect(page).to have_content("Amount must be greater than or equal to 0")
	end
end