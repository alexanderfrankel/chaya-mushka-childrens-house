require 'spec_helper'

feature "Viewing Staff" do
	let!(:staff_member) { create(:faculty_user) }

	before do
		visit '/'
		click_link "Faculty & Staff"
	end

	scenario "all staff" do
		expect(page).to have_content("Faculty & Staff")

		within("#staff") do
			expect(page).to have_content("#{staff_member.first_name} #{staff_member.last_name}")
		end
	end

	scenario "individual staff members" do
		click_link("#{staff_member.first_name} #{staff_member.last_name}")

		expect(page).to have_content("#{staff_member.first_name} #{staff_member.last_name}")
		expect(current_url).to eql(staff_url(staff_member))
	end
end