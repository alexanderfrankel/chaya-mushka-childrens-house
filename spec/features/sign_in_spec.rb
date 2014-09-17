require 'spec_helper'

feature 'Signing In' do
	scenario 'Signing in via form' do
		user = create(:user)

		visit '/'
		click_link 'Sign In'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button "Sign In"

		expect(page).to have_content("Signed in successfully.")
	end

	scenario 'Signin in via form with invalid email' do
		user = create(:user)

		visit '/'
		click_link 'Sign In'
		fill_in 'Email', with: "invalid"
		fill_in 'Password', with: user.password
		click_button "Sign In"

		expect(page).to have_content("Sorry. Your email or password is invalid.")
	end

	scenario 'Signin in via form with invalid password' do
		user = create(:user)

		visit '/'
		click_link 'Sign In'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: "invalid"
		click_button "Sign In"

		expect(page).to have_content("Sorry. Your email or password is invalid.")
	end

	scenario 'Sign Out' do
		sign_in_as!(create(:user))

		visit '/'
		click_link 'Sign Out'
		expect(page).to have_content("Signed out successfully.")
	end

	scenario "Sign In without verification" do
		user = create(:unverified_user)

		visit '/'
		click_link "Sign In"
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button "Sign In"

		expect(page).to have_content("Apologies. Your account has not yet been verified by the administrative office. Please wait for verification email.")
	end

	scenario "remember me" do
	end

	scenario "forgot password" do
	end
end