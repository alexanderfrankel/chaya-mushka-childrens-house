require 'spec_helper'

feature "Creating Posts" do

	let(:faculty_user) { create(:faculty_user) }

	before do
		sign_in_as!(faculty_user)
		click_link "Faculty"
		click_link "New Post"
	end

	scenario "can create a post" do
		fill_in 'Title', with: 'Example Post'
		fill_in 'Content', with: "This is my example post."
		click_button 'Create Post'

		expect(page).to have_content("Post has been created.")

		within "#post #author" do
			expect(page).to have_content("Created by #{faculty_user.email}")
		end
	end

	scenario "can not create a post without a name" do
		click_button 'Create Post'

		expect(page).to have_content("Post has not been created.")
		expect(page).to have_content("Title can't be blank")
	end

	scenario "can not create a post without content" do
		fill_in 'Title', with: 'Example Post'
		click_button "Create Post"

		expect(page).to have_content("Post has not been created.")
		expect(page).to have_content("Content can't be blank")
	end
end