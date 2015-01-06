require 'spec_helper'

feature "hidden NAV links" do
	let(:user) { create(:user) }
	let(:faculty_user) { create(:faculty_user) }
	let(:admin_user) { create(:admin_user) }

	scenario "Sign in as Admin User" do
		sign_in_as!(admin_user)
		visit '/'

		within(".nav-items-user") do
			page.should have_content("Admin")
			page.should have_content("Profile")
			page.should have_content("Sign Out")

			page.should_not have_content("Faculty")
			page.should_not have_content("Sign In")
			page.should_not have_content("Sign Up")
		end
	end

	scenario "Sign in as Faculty User" do
		sign_in_as!(faculty_user)
		visit '/'

		within(".nav-items-user") do
			page.should have_content("Faculty")
			page.should have_content("Profile")
			page.should have_content("Sign Out")

			page.should_not have_content("Admin")
			page.should_not have_content("Sign In")
			page.should_not have_content("Sign Up")
		end
	end

	scenario "Sign in as User" do
		sign_in_as!(user)
		visit '/'

		within(".nav-items-user") do
			page.should have_content("Profile")
			page.should have_content("Sign Out")

			page.should_not have_content("Admin")
			page.should_not have_content("Faculty")
			page.should_not have_content("Sign In")
			page.should_not have_content("Sign Up")
		end
	end

	scenario "Anonymous" do
		visit '/'

		within(".nav-items-user") do
			page.should have_content("Sign Up")
			page.should have_content("Sign In")

			page.should_not have_content("Admin")
			page.should_not have_content("Faculty")
			page.should_not have_content("Profile")
			page.should_not have_content("Sign Out")
		end
	end
end