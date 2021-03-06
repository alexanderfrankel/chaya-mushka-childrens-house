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


module AuthHelpers
	def sign_in(user)
		cookies[:auth_token] = user.auth_token
	end
end

RSpec.configure do |c|
	c.include AuthHelpers, type: :controller
end