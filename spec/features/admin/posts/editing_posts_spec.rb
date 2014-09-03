require 'spec_helper'

feature "Editing Posts" do

	let!(:admin_user) { create(:admin_user) }
	let!(:post) do
		post = create(:post)
		post.update(user: admin_user)
		post
	end

	before do
		sign_in_as!(admin_user)

		visit '/'
		click_link "Admin"
		click_link "Posts"
		click_link "Example Post"
		click_link "Edit Post"
	end

	scenario "Updating a post" do
		fill_in "Title", with: "Example Post beta"
		click_button "Update Post"

		expect(page).to have_content("Post has been updated.")
	end

	scenario "Updating a post with invalid attributes" do
		fill_in "Title", with: ""
		click_button "Update Post"

		expect(page).to have_content("Post has not been updated.")
	end
end