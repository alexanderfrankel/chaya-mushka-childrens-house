require 'spec_helper'

feature "Viewing Users" do

	let!(:admin_user) { create(:admin_user) }
	let!(:unverified_user) { create(:unverified_user) }
	let!(:faculty_user) { create(:faculty_user) }
	let!(:parent_user) { create(:user) }

	before do
		sign_in_as!(admin_user)
		visit '/'
		click_link "Admin"
		click_link "Users"
	end

	scenario "View all unverified users" do
		within("#unverified_users") do
			expect(page).to have_content("#{unverified_user.last_name}, #{unverified_user.first_name}")
		end
	end

	scenario "View all admin users" do
		within("#admin_users") do
			expect(page).to have_content("#{admin_user.last_name}, #{admin_user.first_name}")
		end
	end

	scenario "View all faculty users" do
		within("#faculty_users") do
			expect(page).to have_content("#{faculty_user.last_name}, #{faculty_user.first_name}")
		end
	end

	scenario "View all parent users" do
		within("#parent_users") do
			expect(page).to have_content("#{parent_user.last_name}, #{parent_user.first_name}")
		end
	end

end