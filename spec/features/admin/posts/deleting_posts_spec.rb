require 'spec_helper'

feature "Deleting Posts" do

	let!(:admin_user) { create(:admin_user) }
	let!(:post) { create(:post, user: admin_user) }

	before do
		sign_in_as!(admin_user)
		visit '/'
		click_link "Admin"
		click_link "Posts"
		click_link "Example Post"
	end

	scenario "Deleting a post" do
		click_link "Delete Post"

		expect(page).to have_content("Post has been deleted.")

		visit '/'
		expect(page).to have_no_content("Example Post")
	end
end