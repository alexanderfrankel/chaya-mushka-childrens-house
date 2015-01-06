require 'spec_helper'

feature "Editing Posts" do

	let!(:faculty_user) { create(:faculty_user) }
	let!(:post) do
		post = create(:post, title: "Example Post alpha")
		post.update(user: faculty_user)
		post
	end

	before do
		sign_in_as!(faculty_user)

		visit '/'
		click_link "Faculty"
		click_link "Example Post"
		click_link "Edit Post"
	end

	scenario "Updating a post" do
		fill_in "Title", with: "Example Post beta"
		click_button "Update Post"

		expect(page).to have_content("Example Post beta")
		expect(page).to_not have_content("Example Post alpha")
	end

	scenario "Updating a post with invalid attributes" do
		fill_in "Title", with: ""
		click_button "Update Post"

		expect(page).to have_content("Post has not been updated.")
	end
end