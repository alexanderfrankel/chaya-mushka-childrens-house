require 'spec_helper'

feature "Creating Posts" do
	scenario "can create a post" do
		visit '/'

		click_link 'New Post'

		fill_in 'Title', with: 'Example Post'
		fill_in 'Content', with: "This is my example post."
		click_button 'Create Post'

		expect(page).to have_content("Post has been created.")
	end
end