require 'spec_helper'

feature "hidden links" do
	let(:user) { create(:user) }
	let(:faculty_user) { create(:faculty_user) }
	let(:admin_user) { create(:admin_user) }
	let(:event) { create(:event) }

	context "anonymous users" do
		scenario "cannot see the Add Event link" do
			visit '/'
			click_link "News & Events"
			assert_no_link_for "Add Event"
		end

		scenario "cannot see the Edit Event link" do
			visit event_path(event)
			assert_no_link_for "Edit Event"
		end

		scenario "cannot see the Delete Event link" do
			visit event_path(event)
			assert_no_link_for "Delete Event"
		end
	end

	context "regular users" do
		before { sign_in_as!(user) }
		scenario "cannot see the Add Event link" do
			visit '/'
			click_link "News & Events"
			assert_no_link_for "Add Event"
		end

		scenario "cannot see the Edit Event link" do
			visit event_path(event)
			assert_no_link_for "Edit Event"
		end

		scenario "cannot see the Delete Event link" do
			visit event_path(event)
			assert_no_link_for "Delete Event"
		end
	end

	context "faculty users" do
		before { sign_in_as!(faculty_user) }
		scenario "cannot see the Add Event link" do
			visit '/'
			click_link "News & Events"
			assert_no_link_for "Add Event"
		end

		scenario "cannot see the Edit Event link" do
			visit event_path(event)
			assert_no_link_for "Edit Event"
		end

		scenario "cannot see the Delete Event link" do
			visit event_path(event)
			assert_no_link_for "Delete Event"
		end
	end

	context "admin user" do
		before { sign_in_as!(admin_user) }
		scenario "can see the Add Event Link" do
			visit '/'
			click_link "News & Events"
			assert_link_for "Add Event"
		end

		scenario "can see the Edit Event link" do
			visit event_path(event)
			assert_link_for "Edit Event"
		end

		scenario "can see the Delete Event link" do
			visit event_path(event)
			assert_link_for "Delete Event"
		end
 	end
end