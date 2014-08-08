module AuthenticationHelpers
	def sign_in_as!(user)
		visit '/signin'
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		click_button 'Sign In'
		expect(page).to have_content("Signed in successfully.")
	end
end

RSpec.configure do |c|
	c.include AuthenticationHelpers, type: :feature
end