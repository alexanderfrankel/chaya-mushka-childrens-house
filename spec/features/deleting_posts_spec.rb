require 'spec_helper'

feature "Deleting Posts" do
	scenario "Deleting a post" do
		create(:post, title: "Example Post")

		visit '/'
		click_link "Example Post"
		click_link "Delete Post"

		expect(page).to have_content("Post has been deleted.")

		visit '/'
		expect(page).to have_no_content("Example Post")
	end
end