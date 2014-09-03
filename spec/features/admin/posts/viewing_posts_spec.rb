require 'spec_helper'

feature "Viewing Posts" do
	scenario "Listing all posts" do
		admin_user = create(:admin_user)
		post = create(:post, title: "Example Post")
		post.update(user: admin_user)

		sign_in_as!(admin_user)
		visit '/'
		click_link 'Admin'
		click_link 'Posts'
		click_link 'Example Post'
		expect(page.current_url).to eql(admin_post_url(post))
	end
end