require 'spec_helper'

feature 'Signing In' do
	scenario 'Signing in via form' do
		user = create(:user)

		visit '/'
		click_link 'Sign In'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button "Sign In"

		expect(page).to have_content ("Signed in successfully.")
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
end