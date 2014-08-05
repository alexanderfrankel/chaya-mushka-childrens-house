require 'spec_helper'

feature "Creating Posts" do

	before do
		visit '/'
		click_link 'New Post'
	end

	scenario "can create a post" do
		fill_in 'Title', with: 'Example Post'
		fill_in 'Content', with: "This is my example post."
		click_button 'Create Post'

		expect(page).to have_content("Post has been created.")
	end

	scenario "can not create a post without a name" do
		click_button 'Create Post'

		expect(page).to have_content("Post has not been created.")
		expect(page).to have_content("Title can't be blank")
	end
end