require 'spec_helper'

feature "Viewing Posts" do
	scenario "Listing all posts" do
		faculty_user = create(:faculty_user)
		post = create(:post, title: "Example Post")
		post.update(user: faculty_user)

		sign_in_as!(faculty_user)
		visit '/'
		click_link 'Faculty'
		click_link 'Posts'
		click_link 'Example Post'
		expect(page.current_url).to eql(faculty_post_url(post))
	end
end