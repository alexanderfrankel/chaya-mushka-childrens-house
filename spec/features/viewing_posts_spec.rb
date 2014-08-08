require 'spec_helper'

feature "Viewing Posts" do
	scenario "Listing all posts" do
		user = create(:user)
		post = create(:post, title: "Example Post")
		post.update(user: user)

		visit '/'
		click_link 'Example Post'
		expect(page.current_url).to eql(post_url(post))
	end
end