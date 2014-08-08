require 'spec_helper'

feature "hidden links" do
	let(:user) { create(:user) }
	let(:faculty_user) { create(:faculty_user) }
	let(:post) { create(:post, user: faculty_user) }

	context "anonymous users" do
		scenario "cannot see the New Post link" do
			visit '/'
			assert_no_link_for "New Post"
		end

		scenario "cannot see the Edit Post link" do
			visit post_path(post)
			assert_no_link_for "Edit Post"
		end

		scenario "cannot see the Delete Post link" do
			visit post_path(post)
			assert_no_link_for "Delete Post"
		end
	end

	context "regular users" do
		before { sign_in_as!(user) }
		scenario "cannot see the New Post link" do
			visit '/'
			assert_no_link_for "New Post"
		end

		scenario "cannot see the Edit Post link" do
			visit post_path(post)
			assert_no_link_for "Edit Post"
		end

		scenario "cannot see the Delete Post link" do
			visit post_path(post)
			assert_no_link_for "Delete Post"
		end
	end

	context "faculty users" do
		before { sign_in_as!(faculty_user) }
		scenario "can see the New Post link" do
			visit '/'
			assert_link_for "New Post"
		end

		scenario "can see the Edit Post link" do
			visit post_path(post)
			assert_link_for "Edit Post"
		end

		scenario "can see the Delete Post link" do
			visit post_path(post)
			assert_link_for "Delete Post"
		end
	end
end