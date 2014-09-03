require 'spec_helper'

feature "Deleting Posts" do

	let!(:faculty_user) { create(:faculty_user) }
	let!(:post) { create(:post, user: faculty_user) }

	before do
		sign_in_as!(faculty_user)
		visit '/'
		click_link "Faculty"
		click_link "Example Post"
	end

	scenario "Deleting a post" do
		click_link "Delete Post"

		expect(page).to have_content("Post has been deleted.")

		visit '/'
		expect(page).to have_no_content("Example Post")
	end
end